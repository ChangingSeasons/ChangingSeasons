package Test;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/UploadServlet")
@MultipartConfig(fileSizeThreshold=1024*1024*2,	// 2MB 
				 maxFileSize=1024*1024*10,		// 10MB
				 maxRequestSize=1024*1024*50)	// 50MB
public class UploadServlet extends HttpServlet {

	/**
	 * Name of the directory where uploaded files will be saved, relative to
	 * the web application directory.
	 */
	private static final String SAVE_DIR = "/Users/Summit/Desktop/test";
	
	/**
	 * handles file upload
	 */
	

	
	public static  String ha(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// gets absolute path of the web application
		//String appPath = request.getServletContext().getRealPath("");
		// constructs path of the directory to save uploaded file
		String savePath = SAVE_DIR;
		
		// creates the save directory if it does not exists
		File fileSaveDir = new File(savePath);
		if (!fileSaveDir.exists()) {
			fileSaveDir.mkdir();
		}
		String path ="";
		for (Part part : request.getParts()) {
			String fileName = extractFileName(part);
			System.out.println(fileName);
			part.write(savePath + File.separator + fileName);
			path = savePath + File.separator + fileName;
		}

		return path;
		
//		request.setAttribute("message", "Upload has been done successfully!");
//		getServletContext().getRequestDispatcher("/message.jsp").forward(
//				request, response);
	}

	/**
	 * Extracts file name from HTTP header content-disposition
	 */
	private static String extractFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				return s.substring(s.indexOf("=") + 2, s.length()-1);
			}
		}
		return "";
	}
}