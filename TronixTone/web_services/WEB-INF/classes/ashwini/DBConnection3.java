/*  More, Ashwini    Account: jadrn018
                     CS645, Spring 2016
                     Project #3
*/
package ashwini;

import java.sql.*;
import java.util.*;
import java.io.*;
import java.security.*;

public class DBConnection3 implements java.io.Serializable {
    private  String connectionURL = "jdbc:mysql://opatija:3306/jadrn018?user=jadrn018&password=movement";
    private  Connection connection = null;
    private  Statement statement = null;
    private ResultSet resultSet = null;

    public DBConnection3() {}                                       

public Vector runQuery(String s) {
        String answer = "";
        Vector<String []> answerVector = null;
		
	try {
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	connection = DriverManager.getConnection(connectionURL);
	statement = connection.createStatement();
	ResultSet resultSet = statement.executeQuery(s);        
        ResultSetMetaData rsmd = resultSet.getMetaData();
        answerVector = new Vector<String []>();
	while(resultSet.next()) {
            String [] row = new String[rsmd.getColumnCount()];
            for(int i=0; i < rsmd.getColumnCount(); i++)
                row[i] = resultSet.getString(i+1);
            answerVector.add(row);       
		}
	}
	catch(Exception e) {
	    e.printStackTrace();
	}
       finally {
            try {
                if(resultSet != null)
                   resultSet.close();
                if(statement != null)
                    statement.close();
                if(connection != null)                   
            	    connection.close();
                }
            catch(SQLException e) {
                answer += e;
                }
        }
        return answerVector;
    }  

    public String updateQuery(String query) {
                String answer = "";
                int result = -1;
                try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                connection = DriverManager.getConnection(connectionURL);
                statement = connection.createStatement();
                result = statement.executeUpdate(query);
                }
                catch(Exception e) 
                {
                        e.printStackTrace();
                }
	        finally {
        	    try {
                if(resultSet != null)
                    resultSet.close();
                if(statement != null)
                    statement.close();
                if(connection != null)
                    connection.close();
                }
                  catch(SQLException e) {
                answer += e;
                }
        }
        return (Integer.toString(result));
    }

   public String selectQuery(String query) {
                String answer = "";
                try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                connection = DriverManager.getConnection(connectionURL);
                statement = connection.createStatement();
                resultSet = statement.executeQuery(query);
	        ResultSetMetaData rsmd = resultSet.getMetaData();
                while(resultSet.next()) 
                {
                    for(int i=1; i <= rsmd.getColumnCount(); i++)  
                       answer += resultSet.getString(rsmd.getColumnName(i)) + "|";
                    answer = answer.substring(0, answer.length()-1);                                                                
                }
                }
                catch(Exception e) 
                {  e.printStackTrace();
                }
	        finally {
        	    try {
                if(resultSet != null)
                    resultSet.close();
                if(statement != null)
                    statement.close();
                if(connection != null)
                    connection.close();
                }
	            catch(SQLException e) {
                answer += e;
                }
                } 
        return answer;
    }
}
