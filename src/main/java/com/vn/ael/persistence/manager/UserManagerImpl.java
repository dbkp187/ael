package com.vn.ael.persistence.manager;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.jws.WebService;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.appfuse.model.User;
import org.appfuse.service.MailEngine;
import org.appfuse.service.UserExistsException;
import org.appfuse.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.vn.ael.persistence.repository.UserRepository;
import com.vn.ael.persistence.service.PasswordTokenManager;


/**
 * Implementation of UserManager interface.
 *
 * @author <a href="mailto:matt@raibledesigns.com">Matt Raible</a>
 */
@Service("userManager")
@WebService(serviceName = "UserService", endpointInterface = "org.appfuse.service.UserService")
public class UserManagerImpl extends GenericManagerImpl<User> implements UserManager, UserService, UserDetailsService {
    private PasswordEncoder passwordEncoder;
    private UserRepository userRepository;


    private MailEngine mailEngine;
    private SimpleMailMessage message;
    private PasswordTokenManager passwordTokenManager;

    private String passwordRecoveryTemplate = "passwordRecovery.vm";
    private String passwordUpdatedTemplate = "passwordUpdated.vm";


    @Autowired
    public UserManagerImpl(final UserRepository userRepository) {
        this.userRepository = userRepository;
        this.repository = userRepository;
    }
    
    @Autowired
    @Qualifier("passwordEncoder")
    public void setPasswordEncoder(final PasswordEncoder passwordEncoder) {
        this.passwordEncoder = passwordEncoder;
    }


    @Autowired(required = false)
    public void setMailEngine(final MailEngine mailEngine) {
        this.mailEngine = mailEngine;
    }

    @Autowired(required = false)
    public void setMailMessage(final SimpleMailMessage message) {
        this.message = message;
    }

    @Autowired(required = false)
    public void setPasswordTokenManager(final PasswordTokenManager passwordTokenManager) {
        this.passwordTokenManager = passwordTokenManager;
    }

    /**
     * Velocity template name to send users a password recovery mail (default
     * passwordRecovery.vm).
     *
     * @param passwordRecoveryTemplate the Velocity template to use (relative to classpath)
     * @see org.appfuse.service.MailEngine#sendMessage(org.springframework.mail.SimpleMailMessage, String, java.util.Map)
     */
    public void setPasswordRecoveryTemplate(final String passwordRecoveryTemplate) {
        this.passwordRecoveryTemplate = passwordRecoveryTemplate;
    }

    /**
     * Velocity template name to inform users their password was updated
     * (default passwordUpdated.vm).
     *
     * @param passwordUpdatedTemplate the Velocity template to use (relative to classpath)
     * @see org.appfuse.service.MailEngine#sendMessage(org.springframework.mail.SimpleMailMessage, String, java.util.Map)
     */
    public void setPasswordUpdatedTemplate(final String passwordUpdatedTemplate) {
        this.passwordUpdatedTemplate = passwordUpdatedTemplate;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public User getUser(final String userId) {
        return userRepository.findOne(new Long(userId));
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<User> getUsers() {
        return userRepository.findAll();
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public User saveUser(final User user) throws UserExistsException {

        if (user.getVersion() == null) {
            // if new user, lowercase userId
            user.setUsername(user.getUsername().toLowerCase());
        }

        // Get and prepare password management-related artifacts
        boolean passwordChanged = false;
        if (passwordEncoder != null) {
            // Check whether we have to encrypt (or re-encrypt) the password
            if (user.getVersion() == null) {
                // New user, always encrypt
                passwordChanged = true;
            } else {
                // Existing user, check password in DB
                final String currentPassword = userRepository.getUserPassword(user.getId());
                if (currentPassword == null) {
                    passwordChanged = true;
                } else {
                    if (!currentPassword.equals(user.getPassword())) {
                        passwordChanged = true;
                    }
                }
            }

            // If password was changed (or new user), encrypt it
            if (passwordChanged) {
                user.setPassword(passwordEncoder.encode(user.getPassword()));
            }
        } else {
            log.warn("PasswordEncoder not set, skipping password encryption...");
        }

        try {
            return userRepository.save(user);
        } catch (final Exception e) {
            e.printStackTrace();
            log.warn(e.getMessage());
            throw new UserExistsException("User '" + user.getUsername() + "' already exists!");
        }
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void removeUser(final User user) {
        log.debug("removing user: " + user);
        userRepository.delete(user);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void removeUser(final String userId) {
        log.debug("removing user: " + userId);
        userRepository.delete(new Long(userId));
    }

    /**
     * {@inheritDoc}
     *
     * @param username the login name of the human
     * @return User the populated user object
     * @throws org.springframework.security.core.userdetails.UsernameNotFoundException thrown when username not found
     */
    @Override
    public User getUserByUsername(final String username) throws UsernameNotFoundException {
        return (User) userRepository.findByUsername(username);
    }

    @Override
    public String buildRecoveryPasswordUrl(final User user, final String urlTemplate) {
        final String token = generateRecoveryToken(user);
        final String username = user.getUsername();
        return StringUtils.replaceEach(urlTemplate,
                new String[]{"{username}", "{token}"},
                new String[]{username, token});
    }

    @Override
    public String generateRecoveryToken(final User user) {
        return passwordTokenManager.generateRecoveryToken(user);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public boolean isRecoveryTokenValid(final String username, final String token) {
        return isRecoveryTokenValid(getUserByUsername(username), token);
    }

    @Override
    public boolean isRecoveryTokenValid(final User user, final String token) {
        return passwordTokenManager.isRecoveryTokenValid(user, token);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void sendPasswordRecoveryEmail(final String username, final String urlTemplate) {
        log.debug("Sending password recovery token to user: " + username);

        final User user = getUserByUsername(username);
        final String url = buildRecoveryPasswordUrl(user, urlTemplate);

        sendUserEmail(user, passwordRecoveryTemplate, url);
    }

    private void sendUserEmail(final User user, final String template, final String url) {
        message.setTo(user.getFullName() + "<" + user.getEmail() + ">");

        final Map<String, Serializable> model = new HashMap<String, Serializable>();
        model.put("user", user);
        model.put("applicationURL", url);

        mailEngine.sendMessage(message, template, model);
    }


    /**
     * {@inheritDoc}
     */
    @Override
    public User updatePassword(final String username, final String currentPassword, final String recoveryToken, final String newPassword, final String applicationUrl) throws UserExistsException {
        User user = getUserByUsername(username);
        if (isRecoveryTokenValid(user, recoveryToken)) {
            log.debug("Updating password from recovery token for user:" + username);
            user.setPassword(newPassword);
            user = saveUser(user);
            passwordTokenManager.invalidateRecoveryToken(user, recoveryToken);

            sendUserEmail(user, passwordUpdatedTemplate, applicationUrl);

            return user;
        } else if (StringUtils.isNotBlank(currentPassword)) {
            if (passwordEncoder.matches(currentPassword, user.getPassword())) {
                log.debug("Updating password (providing current password) for user:" + username);
                user.setPassword(newPassword);
                user = saveUser(user);
                return user;
            }
        }
        // or throw exception
        return null;
    }

	@Override
	public UserDetails loadUserByUsername(String userName)
			throws UsernameNotFoundException {
		return this.getUserByUsername(userName);
	}

	@Override
	public User getLoggedUser(HttpServletRequest request) {
		String userName = request.getRemoteUser();
		if (userName != null){
			return this.getUserByUsername(userName);
		}
		return null;
	}

	@Override
	public User findById(Long id) {
		return this.repository.getOne(id);
	}

	@Override
	public User findById(String id) {
		return this.findById(Long.valueOf(id));
	}

	@Override
	public List<User> getAllUser() {
		// TODO Auto-generated method stub
		return this.repository.findAll();
	}
}
