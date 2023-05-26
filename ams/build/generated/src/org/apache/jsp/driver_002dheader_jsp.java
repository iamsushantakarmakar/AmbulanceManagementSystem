package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.OutputStream;
import java.sql.ResultSet;
import com.connection.DatabaseConnection;
import java.util.Base64;
import java.sql.Blob;

public final class driver_002dheader_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html; charset=ISO-8859-1");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<header class=\"header header_style_01\">\r\n");
      out.write("    <nav class=\"megamenu navbar navbar-default\">\r\n");
      out.write("        <div class=\"container-fluid\">\r\n");
      out.write("            <div class=\"navbar-header\">\r\n");
      out.write("                <img src=\"images/logos/logo.png\" class=\"logo\" alt=\"LoGo\" onclick=\"window.location.assign('driver-dashboard.jsp')\">\r\n");
      out.write("                <button type=\"button\" class=\"navbar-toggle collapsed\"\r\n");
      out.write("                        data-toggle=\"collapse\" data-target=\"#navbar\" aria-expanded=\"false\"\r\n");
      out.write("                        aria-controls=\"navbar\">\r\n");
      out.write("                    <span class=\"sr-only\">Toggle navigation</span> <span\r\n");
      out.write("                        class=\"icon-bar\"></span> <span class=\"icon-bar\"></span> <span\r\n");
      out.write("                        class=\"icon-bar\"></span>\r\n");
      out.write("                </button>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div id=\"navbar\" class=\"navbar-collapse collapse\">\r\n");
      out.write("                <ul class=\"nav navbar-nav navbar-right\">\r\n");
      out.write("                    <li><a class=\"active\" href=\"driver-dashboard.jsp\">Home</a></li>\r\n");
      out.write("                    <li><a class=\"btn-primary btn-radius btn-brd log\" href=\"patient-request-driver-for-ambulance.jsp\">Patients Request For Ambulance</a></li>\r\n");
      out.write("                    <li><a class=\"btn-primary btn-radius btn-brd log\" href=\"add-ambulance-driver.jsp\">Add Ambulance</a></li>\r\n");
      out.write("                    <li><a class=\"btn-primary btn-radius btn-brd log\" href=\"driver-view-ambulance.jsp\">View Ambulance</a></li>\r\n");
      out.write("                    <li><a class=\"btn-primary btn-radius btn-brd log\" href=\"driver-ambulance-status.jsp\">Ambulance Status</a></li>\r\n");
      out.write("                        ");

                            byte[] imgData = null;
                            OutputStream img = null;
                            String encode = null;
                            ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select driver_image from tbldriver where uname='" + session.getAttribute("uname") + "' and driver_id='" + session.getAttribute("did") + "'");
                            if (resultset.next()) {
                                Blob image = resultset.getBlob(1);
                                imgData = image.getBytes(1, (int) image.length());
                                encode = Base64.getEncoder().encodeToString(imgData);
                            }
                        
      out.write("\r\n");
      out.write("                    <li class=\"dropdown\"><a class=\"dropdown-toggle\"\r\n");
      out.write("                                            data-toggle=\"dropdown\" href=\"#\"><span class=\"caret\"></span><img src=\"data:image/jpg;base64,");
      out.print(encode);
      out.write("\" style=\"width: 35px; height: 30px; border-radius: 20px; \"> </a>\r\n");
      out.write("\r\n");
      out.write("                        <ul class=\"dropdown-menu\">\r\n");
      out.write("                            <li><a href=\"driver-profile.jsp\">My Profile</a></li>\r\n");
      out.write("                            <li><a href=\"driver-change-password.jsp\">Change Password</a></li>\r\n");
      out.write("                            <li><a href=\"driver-edit-image.jsp\" >Profile Picture</a></li>\r\n");
      out.write("                            <li><a href=\"logout.jsp\">Logout</a></li>\r\n");
      out.write("                        </ul>\r\n");
      out.write("                    </li>\r\n");
      out.write("                </ul>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </nav>\r\n");
      out.write("</header>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
