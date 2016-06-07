package com.vn.ael.webapp.controller;

import java.beans.PropertyEditorSupport;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.poi.util.StringUtil;
import org.appfuse.Constants;
import org.appfuse.model.User;
import org.appfuse.service.MailEngine;
import org.exolab.castor.types.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.CustomNumberEditor;
import org.springframework.context.MessageSource;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.validation.Validator;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;

import com.vn.ael.constants.FormatterPattern;
import com.vn.ael.enums.ServicesType;
import com.vn.ael.persistence.entity.Attachment;
import com.vn.ael.persistence.entity.Realattachment;
import com.vn.ael.persistence.manager.AttachmentManager;
import com.vn.ael.persistence.manager.ConfigurationManager;
import com.vn.ael.persistence.manager.RealattachmentManager;
import com.vn.ael.persistence.manager.UserManager;
import com.vn.ael.persistence.service.EntityService;
import com.vn.ael.webapp.formatter.CustomDateTimeFormat;
import com.vn.ael.webapp.formatter.CustomNumberFormatter;

/**
 * Implementation of <strong>SimpleFormController</strong> that contains
 * convenience methods for subclasses.  For example, getting the current
 * user and saving messages/errors. This class is intended to
 * be a base class for all Form controllers.
 *
 * <p><a href="BaseFormController.java.html"><i>View Source</i></a></p>
 *
 * @author <a href="mailto:matt@raibledesigns.com">Matt Raible</a>
 */
public class BaseFormController implements ServletContextAware {
    public static final String MESSAGES_KEY = "successMessages";
    public static final String ERRORS_MESSAGES_KEY = "errors";
    protected final transient Log log = LogFactory.getLog(getClass());
    private UserManager userManager = null;
    protected EntityService entityService = null;
    protected MailEngine mailEngine = null;
    protected SimpleMailMessage message = null;
    protected String templateName = "accountCreated.vm";
    protected String cancelView;
    protected String successView;

    private MessageSourceAccessor messages;
    private ServletContext servletContext;
    
    protected RealattachmentManager realattachmentManager = null;
    protected ConfigurationManager configurationManager = null;
	 
    @Autowired
    public void setConfigurationManager(final ConfigurationManager configurationManager) {
        this.configurationManager = configurationManager;
    }
    
    @Autowired
    public void setRealattachmentManager(final RealattachmentManager realattachmentManager) {
        this.realattachmentManager = realattachmentManager;
    }

    @Autowired(required = false)
    Validator validator;

    @Autowired
    public void setMessages(MessageSource messageSource) {
        messages = new MessageSourceAccessor(messageSource);
    }

    @Autowired
    public void setUserManager(UserManager userManager) {
        this.userManager = userManager;
    }
    
    @Autowired
    public void setEntityService(EntityService entityService) {
        this.entityService = entityService;
    }

    public UserManager getUserManager() {
        return this.userManager;
    }
    
    public EntityService getEntityService() {
        return this.entityService;
    }

    @SuppressWarnings("unchecked")
    public void saveError(HttpServletRequest request, String error) {
        List errors = (List) request.getSession().getAttribute(ERRORS_MESSAGES_KEY);
        if (errors == null) {
            errors = new ArrayList();
        }
        errors.add(error);
        request.getSession().setAttribute(ERRORS_MESSAGES_KEY, errors);
    }
    
    @SuppressWarnings("unchecked")
    public void saveMessage(HttpServletRequest request, String msg) {
        List messages = (List) request.getSession().getAttribute(MESSAGES_KEY);

        if (messages == null) {
            messages = new ArrayList();
        }

        messages.add(msg);
        request.getSession().setAttribute(MESSAGES_KEY, messages);
    }

    /**
     * Convenience method for getting a i18n key's value.  Calling
     * getMessageSourceAccessor() is used because the RequestContext variable
     * is not set in unit tests b/c there's no DispatchServlet Request.
     *
     * @param msgKey
     * @param locale the current locale
     * @return
     */
    public String getText(String msgKey, Locale locale) {
        return messages.getMessage(msgKey, locale);
    }

    /**
     * Convenient method for getting a i18n key's value with a single
     * string argument.
     *
     * @param msgKey
     * @param arg
     * @param locale the current locale
     * @return
     */
    public String getText(String msgKey, String arg, Locale locale) {
        return getText(msgKey, new Object[] { arg }, locale);
    }

    /**
     * Convenience method for getting a i18n key's value with arguments.
     *
     * @param msgKey
     * @param args
     * @param locale the current locale
     * @return
     */
    public String getText(String msgKey, Object[] args, Locale locale) {
        return messages.getMessage(msgKey, args, locale);
    }

    /**
     * Convenience method to get the Configuration HashMap
     * from the servlet context.
     *
     * @return the user's populated form from the session
     */
    public Map getConfiguration() {
        Map config = (HashMap) servletContext.getAttribute(Constants.CONFIG);

        // so unit tests don't puke when nothing's been set
        if (config == null) {
            return new HashMap();
        }

        return config;
    }

    /**
     * Set up a custom property editor for converting form inputs to real objects
     * @param request the current request
     * @param binder the data binder
     */
    @InitBinder
    protected void initBinder(HttpServletRequest request,
                              ServletRequestDataBinder binder) {
        binder.registerCustomEditor(Integer.class, null,
                                    new CustomNumberFormatter(Integer.class, null, true));
        binder.registerCustomEditor(Long.class, null,
                                    new CustomNumberEditor(Long.class, null, true));
        binder.registerCustomEditor(byte[].class,
                                    new ByteArrayMultipartFileEditor());
        SimpleDateFormat dateFormat = 
            new SimpleDateFormat(FormatterPattern.DATE_FOMART, request.getLocale());
        SimpleDateFormat dateTimeFormat = 
                new SimpleDateFormat(FormatterPattern.DATE_TIME_FORMAT, request.getLocale());
        dateFormat.setLenient(false);
        dateTimeFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, null, 
                                    new CustomDateTimeFormat(dateFormat,dateTimeFormat, true));
        binder.registerCustomEditor(DateTime.class, null, 
                new CustomDateTimeFormat(dateFormat,dateTimeFormat, true));
        binder.registerCustomEditor(ServicesType.class, null, new PropertyEditorSupport() {
            @Override
            public void setAsText(String text) {
                Integer value = Integer.parseInt(text);
                setValue(ServicesType.fromValue(value));
            }
            
            @Override
            public String getAsText(){
            	if (this.getValue() == null){
            		return String.valueOf(ServicesType.DVTQ.getValue());
            	}
				return String.valueOf(((ServicesType)this.getValue()).getValue());
            }
        });
    }

    /**
     * Convenience message to send messages to users, includes app URL as footer.
     * @param user the user to send a message to.
     * @param msg the message to send.
     * @param url the URL of the application.
     */
    protected void sendUserMessage(User user, String msg, String url) {
        if (log.isDebugEnabled()) {
            log.debug("sending e-mail to user [" + user.getEmail() + "]...");
        }

        message.setTo(user.getFullName() + "<" + user.getEmail() + ">");

        Map<String, Serializable> model = new HashMap<String, Serializable>();
        model.put("user", user);

        // TODO: once you figure out how to get the global resource bundle in
        // WebWork, then figure it out here too.  In the meantime, the Username
        // and Password labels are hard-coded into the template. 
        // model.put("bundle", getTexts());
        model.put("message", msg);
        model.put("applicationURL", url);
        mailEngine.sendMessage(message, templateName, model);
    }

    @Autowired
    public void setMailEngine(MailEngine mailEngine) {
        this.mailEngine = mailEngine;
    }

    @Autowired
    public void setMessage(SimpleMailMessage message) {
        this.message = message;
    }

    public void setTemplateName(String templateName) {
        this.templateName = templateName;
    }
   
    public final BaseFormController setCancelView(String cancelView) {
        this.cancelView = cancelView;
        return this;
    }

    public final String getCancelView() {
        // Default to successView if cancelView is invalid
        if (this.cancelView == null || this.cancelView.length()==0) {
            return getSuccessView();
        }
        return this.cancelView;   
    }

    public final String getSuccessView() {
        return this.successView;
    }
    
    public final BaseFormController setSuccessView(String successView) {
        this.successView = successView;
        return this;
    }

    public void setServletContext(ServletContext servletContext) {
        this.servletContext = servletContext;
    }

    protected ServletContext getServletContext() {
        return servletContext;
    }
    
    /**
     * Load attachment and review on browser
     * @param request
     * @param response
     * @param id
     * @throws Exception
     */
    protected void loadFile(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	String id = request.getParameter("id");
    	try{
	    	Realattachment uploadedFile = this.realattachmentManager.findByAttachment(Long.valueOf(id));
	        response.setHeader("Content-Disposition","inline; filename=\"" + uploadedFile.getAttachment().getFileName() +"."+uploadedFile.getExtension()+ "\"");

	    	// Send the file.
	    	ServletOutputStream  out = response.getOutputStream();
	    	if(uploadedFile != null){
	    		out.write(uploadedFile.getData(), 0, uploadedFile.getData().length);
	    	}
	        out.flush();
	        out.close();
        }catch(Exception ex){
        	log.error("file not found in db", ex);
        }
	}
}
