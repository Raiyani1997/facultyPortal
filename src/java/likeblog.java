/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author rraiy
 */
public class likeblog extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        HttpSession ession1 = request.getSession();
        String uid = ession1.getAttribute("uid").toString(); 
        
        Connection con = Snippet.getConnection();
        String sql = "select * from likes where f_id = ? and b_id = ?",sql1="";
        
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, uid);
        ps.setInt(2, Integer.parseInt(request.getParameter("bid")));
        ResultSet rs = ps.executeQuery();
        int like = 0,your = 1;
        String result = request.getParameter("like");
        //response.getWriter().println(result+" "+request.getParameter("bid"));
        
        if(rs.next()){
            your = rs.getInt("likes");
            response.getWriter().println(your+" "+result);
            if(your == 1 && result.equals("true")){
                your = 2;
                like = 1;
                sql = "update blogs set liked = liked + ? where b_id = ?";
            }
            else if(your == 2 && result.equals("true")){
                your = 2;
                like = 0;
                sql = "update blogs set liked = liked + ? where b_id = ?";
            }
            else if(your == 0 && result.equals("true")){
                your = 2;
                like = 1;
                sql = "update blogs set liked = liked + ?,unliked = unliked - 1 where b_id = ?";
            }
            else if(your == 1 && result.equals("false")){
                your = 0;
                like = 1;
                sql = "update blogs set unliked = unliked + ? where b_id = ?";
            }
            else if(your == 0 && result.equals("false")){
                your = 0;
                like = 0;
                sql = "update blogs set unliked = unliked + ? where b_id = ?";
            }
            else if(your == 2 && result.equals("false")){
                your = 0;
                like = 1;
                sql = "update blogs set unliked = unliked + ?,liked = liked-1 where b_id = ?";
            }
            sql1 = "update likes set likes = ? where b_id = ? and f_id = ?";
        }
        else{
            if(result.equals("true")){
                your = 2;
                like = 1;
                sql = "update blogs set liked = liked + ? where b_id = ?";
                response.getWriter().println(your+" "+result);
            }
            else{
                your = 0;
                like = 1;
                sql = "update blogs set unliked = unliked +1 ? where b_id = ?";
            }
            
            sql1 = "insert into likes(li_id,likes,b_id,f_id) values(like_id.nextval,?,?,?)";
        }
        
        ps = con.prepareStatement(sql1);
        ps.setInt(1, your);
        ps.setInt(2, Integer.parseInt(request.getParameter("bid")));
        ps.setString(3, uid);
        ps.executeUpdate();
        
        ps = con.prepareStatement(sql);
        ps.setInt(1, like);
        ps.setInt(2, Integer.parseInt(request.getParameter("bid")));
        ps.executeUpdate();
        
        con.close();
        response.sendRedirect("Blogs.jsp");
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(likeblog.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(likeblog.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
