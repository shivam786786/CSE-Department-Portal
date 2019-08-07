<%@page import="modulecatalog.dto.QueryDTO"%>
<%
    QueryDTO queryObj = (QueryDTO) request.getAttribute("query");
    StringBuffer data = new StringBuffer();
    if(queryObj.getQuestion() != null) {
           
    data.append("<div id='queryReplayModal' class='modal fade'  role='dialog'>");
    data.append("<div class='modal-dialog modal-md modal-dialog-centered'>");
    data.append("<div class='modal-content'>");
    data.append("<div class='modal-header text-center bg-danger'>");
    data.append("<h4 class='modal-title text-white  text-center'> <i class='fas fa-chalkboard-teacher'></i>&nbsp;&nbsp;&nbsp;Replay</h4>");
    data.append("<button type='button' class='close' data-dismiss='modal'>&times;</button></div>");
    data.append("<div class='modal-body'>");
    data.append("<form id='queryReplay' role='form'>");
    data.append("<label class='text-danger'><h4>- Topic :</h4></label>");
    data.append("<div class='form-group'>");
    data.append("<input type='text' class='form-control' value='"+queryObj.getTopic()+"' readonly></div>");
    data.append("<label class='text-danger'><h4>- Question :</h4></label>");
    data.append("<div class='form-group'>");
    data.append("<input type='text' class='form-control' id='getQuestion' value='"+queryObj.getQuestion()+"' readonly></textarea></div>");
    data.append("<label class='text-danger'><h4>- Answer :</h4></label>");
    data.append("<div class='form-group'>");
    if(queryObj.getAnswer() == null)
        data.append("<textarea class='form-control' rows='4' id='replyAnswer' placeholder='ANS:- Write Your Answer Here'></textarea></div>");
    else
        data.append("<textarea class='form-control' rows='4' id='replyAnswer'>"+queryObj.getAnswer()+"</textarea></div>");
    data.append("<div class='form-group'>");
    data.append("<input type='button' class='btn btn-lg btn-success btn-block' id='reply' onclick = 'sendReply()' data-toggle='modal' data-dismiss='modal' value='Submit Answer'>");
    data.append("</form>");
    data.append("</div>");
    data.append("<div class='modal-footer bg-light'>");
    data.append("<button type='button' class='btn btn-primary btn-md text-center'  data-dismiss='modal' > Close</button></div></div></div></div>");
    out.println(data);
    }
%>