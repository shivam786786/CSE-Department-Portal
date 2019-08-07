/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modulecatalog.dto;

/**
 *
 * @author HP
 */
public class QueryDTO {
String question;
String answer;
String askesdby;
String answeredby;
String timestamp;
String topic;
String subject;
String id;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public String getAskesdby() {
        return askesdby;
    }

    public void setAskesdby(String askesdby) {
        this.askesdby = askesdby;
    }

    public String getAnsweredby() {
        return answeredby;
    }

    public void setAnsweredby(String answeredby) {
        this.answeredby = answeredby;
    }

    public String getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(String timestamp) {
        this.timestamp = timestamp;
    }

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    @Override
    public String toString() {
        return "QueryDTO{" + "question=" + question + ", answer=" + answer + ", askesdby=" + askesdby + ", answeredby=" + answeredby + ", timestamp=" + timestamp + ", topic=" + topic + ", subject=" + subject + ", id=" + id + '}';
    }

   
}
