/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modulecatalog.dto;

import java.sql.Date;

/**
 *
 * @author HP
 */
public class FileDTO {
    
    
  private String file_id;
  private String filename;
  private String subject;

    @Override
    public String toString() {
        return "FileDTO{" + "file_id=" + file_id + ", filename=" + filename + ", subject=" + subject + ", time_Stamp=" + time_Stamp + ", filepath=" + filepath + ", description=" + description + '}';
    }
  private Date time_Stamp;
  private String filepath;
  private String description;

    public String getFile_id() {
        return file_id;
    }

    public void setFile_id(String file_id) {
        this.file_id = file_id;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public Date getTime_Stamp() {
        return time_Stamp;
    }

    public void setTime_Stamp(Date time_Stamp) {
        this.time_Stamp = time_Stamp;
    }

    public String getFilepath() {
        return filepath;
    }

    public void setFilepath(String filepath) {
        this.filepath = filepath;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
  
  
  
  
}
