package com.vn.ael.webapp.controller;

import org.appfuse.Constants;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.vn.ael.constants.URLReference;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

/**
 * Controller class to upload Files.
 * <p/>
 * <p>
 * <a href="FileUploadFormController.java.html"><i>View Source</i></a>
 * </p>
 *
 * @author <a href="mailto:matt@raibledesigns.com">Matt Raible</a>
 */
@Controller
public class FileUploadController extends BaseFormController {

    public FileUploadController() {
        setCancelView("redirect:/home");
        setSuccessView("uploadDisplay");
    }

    @RequestMapping(value=URLReference.OFFERFORM_DOWN_ATTACHMENT, method = RequestMethod.GET)
    public void reviewFile(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	this.loadFile(request, response);
	}
    
    @RequestMapping(value=URLReference.DOCSGENERAL_INVOICES, method = RequestMethod.GET)
    public void reviewFileDocs(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	this.loadFile(request, response);
	}
    
}
