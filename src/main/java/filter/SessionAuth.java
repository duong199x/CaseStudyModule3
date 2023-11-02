package filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class SessionAuth {
    public static boolean checkAuthentication(HttpServletRequest request){
        HttpSession session = request.getSession(false);
        if(session != null){
            if (session.getAttribute("authentication")!=null){
                return true;
            }
        }
        return false;
    }
    public static boolean isAdmin(HttpServletRequest request){
        HttpSession session = request.getSession(false);
        if(session != null){
            if (session.getAttribute("role").equals("admin")){
                return true;
            }
        }
        return false;
    }
}
