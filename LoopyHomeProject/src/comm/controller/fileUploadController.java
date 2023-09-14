package comm.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


@WebServlet("/upload.do")
@MultipartConfig
public class fileUploadController extends HttpServlet {
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      String saveFolder = "D:/2.work/2.Highjava/LoopyHomeProject/WebContent/images";
      String fileName= null;
      for(Part part : request.getParts()) {
         fileName = getFileName(part);
         UUID uuidTemp = UUID.randomUUID();
         //fileName = uuidTemp.toString().replace("-", "") + fileName;
         part.write(saveFolder + File.separator+fileName);
      }
      PrintWriter out = response.getWriter();
      out.write("/tomcatImg/"+fileName);
   }
    private String getFileName(Part part) {
           String contentDisp = part.getHeader("content-disposition");
           System.out.println(" LOG :: content-disposition 헤더 :: = "+contentDisp);
           String[] tokens = contentDisp.split(";");
           for (String token : tokens) {
               if (token.trim().startsWith("filename")) {
                  System.out.println(" LOG :: 파일 이름 :: " + token);
                   return token.substring(token.indexOf("=") + 2, token.length()-1);
               }
           }
           return "";
       }
}