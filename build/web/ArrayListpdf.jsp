              <%@page import="modulecatalog.dto.MarksUpdate"%>
<%@page import="modulecatalog.dto.FileDTO"%>
<%@page import="java.util.ArrayList"%>

<%System.out.println("in arraylistpdf"); 
    StringBuffer display=new StringBuffer();
        String subject=(String)request.getAttribute("subject");
          ArrayList<MarksUpdate> marks=(ArrayList<MarksUpdate>)request.getAttribute("marks");
        String subjectformarks=(String)request.getAttribute("subjectformarks");
        if(subject!=null)
        {
       System.out.println("subject:"+subject);
      System.out.println(subject);
       out.println(subject);
        }
       
      
        else{
        System.out.println("hellllllllllllllllllllllllloooooooooooooooooo");
           ArrayList<FileDTO> file=(ArrayList<FileDTO>)request.getAttribute("file");
                     if(file.size()==0)
     {
          
     display.append("<tr><div><td colspan='5'><label>"+"No file is been uploaded"+"</label></td></div></div>");
    }    
     else{
                         for(FileDTO f:file)
                         {
     display.append("<tr><div><td><label>"+f.getFile_id()+"</label></td><td><label>"+f.getFilename()+"</label></td><td><label>"+f.getDescription()+"</label></td><td><label>"+f.getTime_Stamp()+"</label></td><td class='bg-success'><a role='button' href='FileDownloadServlet?id="+f.getFile_id()+"' class='text-white text-decoration-none'>Download <i class='fas fa-arrow-circle-down 2x'></i></a></td></div></tr>");                      
                     }
                     }
                     out.println(display);
        } %>