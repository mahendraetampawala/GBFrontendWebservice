
/**
 * 
 */
package com;

/**
 * @author Mahendra
 *
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement; 


public class feedback 
{ //A common method to connect to the DB
	private Connection connect() 
	 { 
		 Connection con = null; 
		 try
		 { 
		 Class.forName("com.mysql.jdbc.Driver"); 
		 
		 //Provide the correct details: DBServer/DBName, username, password 
		 con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/newdb", "root", ""); 
		 } 
		 catch (Exception e) 
		 {e.printStackTrace();} 
		 return con; 
	 } 
	
	public String insertItem(String cusid, String itemid, String feedbackid, String feed) 
	 { 
		 String output = ""; 
		 try
		 { 
		 Connection con = connect(); 
		 if (con == null) 
		 {return "Error while connecting to the database for inserting."; } 
		 // create a prepared statement
		 String query = " insert into feedbacks(`FID`,`CustomerID`,`ItemID`,`FeedbackID`,`FeedBack`)"+ " values (?, ?, ?, ?, ?)"; 
		 PreparedStatement preparedStmt = con.prepareStatement(query); 
		 // binding values
		 preparedStmt.setInt(1, 0);
			preparedStmt.setString(2, cusid);
			preparedStmt.setString(3, itemid);
			preparedStmt.setString(4,feedbackid);
			preparedStmt.setString(5, feed);
		// preparedStmt.setDouble(4, Double.parseDouble(price)); 
		 //preparedStmt.setString(5, desc); 
		// execute the statement3
		 preparedStmt.execute(); 
		 con.close(); 
		 String newItems = displayfeedback();
			output = "{\"status\":\"success\", \"data\": \"" +
					newItems + "\"}";
			
		}
		 catch (Exception e) 
		 { 
			 output = "{\"status\":\"error\", \"data\": \"Error while inserting the feedback.\"}";
				System.err.println(e.getMessage());
		 } 
		 return output; 
	 } 

	


	public String displayfeedback() 
	{ 
		 String output = ""; 
		 try
		 { 
		 Connection con = connect(); 
		 if (con == null) 
		 {return "Error while connecting to the database for reading."; } 
		 // Prepare the html table to be displayed
		 output = "<table border='0'; width=100%;>";
				
			
		 
		 String query = "select * from feedbacks"; 
		 Statement stmt = con.createStatement(); 
		 ResultSet rs = stmt.executeQuery(query); 
		 // iterate through the rows in the result set
		 while (rs.next()) 
		 { 
		 String FID = Integer.toString(rs.getInt("FID")); 
		 String CustomerID = rs.getString("CustomerID"); 
		 String ItemID = rs.getString("ItemID"); 
		 String FeedbackID = rs.getString("FeedbackID"); 
		 String FeedBack = rs.getString("FeedBack"); 
		
		 // Add into the html table
		
		 
	        
			output += "<div class=\"review\">";
			output += "<div class=\"container-fluid\">";
			output += "<div class=\"row align-items-center review-slider normal-slider\">";  
			output +=  "<div class=\"col-md-6\">";     
			output += "<div class=\"review-slider-item\">";             
			
			//title + " " + name + ",";
			output += "<div class=\"review-text\">";                
			output += "Item ID :"+ItemID;
			output +="<br>";
			output +=   FeedBack;
			output += "<div class=\"ratting\">";  
			output += "<i class=\"fa fa-star\"></i>";                       
			output += "<i class=\"fa fa-star\"></i>";  
			output += "<i class=\"fa fa-star\"></i>";  
			output += "<i class=\"fa fa-star\"></i>";  
			output += "</div>";                     
			output += "</div>";                  
			output += "</div>";           
			output += "</div>";        
			        
	           
			output +="</div>";     
			output +="</div>";     
			output +="</div>";  
	       
					  
			}
			
			con.close();
			
			// Complete the html table
		
	
			output += "</table>";
			}
			catch (Exception e)
			{
				output = "Error while reading the feedbacks.";
				System.err.println(e.getMessage());
			}
			
			return output;
		}

	}