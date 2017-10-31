package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.DispatcherType;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.bd.AtencionPodologica;
import model.bd.Data;

/**
 *
 * @author pgonzalez
 */
@WebServlet(name = "RegistrarAtencionPodologicaServlet", urlPatterns = {"/registrarAtencion.do"})
public class RegistrarAtencionPodologicaServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest req, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Data d = new Data();
            int ficha, usuario, testo; //<--fk de ficha y usuario

            String fecha, observaciones;

            float presion, peso, tpodal_d, tpodal_i;

            int pulsoRadial, pulsoPedio_d, pulsoPedio_i, tratamientoOrtonixia;

            boolean sens_d, sens_i, curacion, coloqPuente, resecado, enucleacion,
                    devastado, maso, espiculoectomia, analgesia, colocacionAcrilico,
                    bandaMolecular, colocacionPuente, poli;

            usuario                 = Integer.parseInt(     req.getParameter("usuario"));
            ficha                   = Integer.parseInt(     req.getParameter("ficha"));

//        fecha = req.getParameter("");
            presion                 = Float.parseFloat(     req.getParameter("presion"));
            pulsoRadial             = Integer.parseInt(     req.getParameter("pulso"));
            peso                    = Float.parseFloat(     req.getParameter("peso"));
            pulsoPedio_d            = Integer.parseInt(     req.getParameter("ppd"));
            pulsoPedio_i            = Integer.parseInt(     req.getParameter("ppi"));
            sens_d                  = Boolean.parseBoolean( req.getParameter("spd"));
            sens_i                  = Boolean.parseBoolean( req.getParameter("spi"));
            tpodal_d                = Float.parseFloat(     req.getParameter("tpd"));
            tpodal_i                = Float.parseFloat(     req.getParameter("tpi"));
            curacion                = Boolean.parseBoolean( req.getParameter("curacion"));
            //coloqPuente = Boolean.parseBoolean(req.getParameter(""));
            resecado                = Boolean.parseBoolean( req.getParameter("resecado"));
            enucleacion             = Boolean.parseBoolean( req.getParameter("enu"));
            devastado               = Boolean.parseBoolean( req.getParameter("devastado"));
            maso                    = Boolean.parseBoolean( req.getParameter("maso"));
            espiculoectomia         = Boolean.parseBoolean( req.getParameter("epi"));
            analgesia               = Boolean.parseBoolean( req.getParameter("anal"));
            colocacionAcrilico      = Boolean.parseBoolean( req.getParameter("acri"));
            bandaMolecular          = Boolean.parseBoolean( req.getParameter("cbm"));
            colocacionPuente        = Boolean.parseBoolean( req.getParameter("cpuente"));
            tratamientoOrtonixia    = Integer.parseInt(     req.getParameter("to"));
            poli                    = Boolean.parseBoolean( req.getParameter("cpoli"));
            observaciones           =                       req.getParameter("obs");

            
            testo                  = (req.getParameter("spd").equals(""))?0:Integer.parseInt(req.getParameter("spd"));
            
            AtencionPodologica a = new AtencionPodologica();
            a.setFicha(ficha);
            a.setUsuario(usuario);
//        a.setFecha(fecha);
            a.setPresion(presion);
            a.setPulsoRadial(pulsoRadial);
            a.setPeso(peso);
            
            a.setPulsoPedio_d(pulsoPedio_d);
            a.setPulsoPedio_i(pulsoPedio_i);
            a.setSens_d(sens_d);
            a.setSens_i(sens_i);
            
            a.settPoda1_d(tpodal_d);
            a.settPoda1_i(tpodal_i);
            a.setCuracion(curacion);
            a.setResecado(resecado);
            a.setEnucleacion(enucleacion);
            a.setDevastado(devastado);
            a.setMaso(maso);
            a.setEspiculoectomia(espiculoectomia);
            a.setAnalgesia(analgesia);
            a.setColocacionAcrilico(colocacionAcrilico);
            a.setBandaMolecular(bandaMolecular);
            a.setColocacionPuente(colocacionPuente);
            a.setTratamientoOrtonixia(tratamientoOrtonixia);
            a.setPoli(poli);
            a.setObservaciones(observaciones);
            
            d.registrarAtencionPodologica(a);

        response.sendRedirect("buscarPaciente.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(RegistrarAtencionPodologicaServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RegistrarAtencionPodologicaServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        processRequest(request, response);
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
        processRequest(request, response);
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
