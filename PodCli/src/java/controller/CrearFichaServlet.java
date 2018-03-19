package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.bd.Data;
import model.bd.Ficha;
import model.bd.Paciente;

@WebServlet(name = "CrearFichaServlet", urlPatterns = {"/crearFicha.do"})
public class CrearFichaServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {

            try {
                Data d = new Data();
                Paciente nuevoPaciente = new Paciente();
                Ficha nuevaFicha = new Ficha();

                /*Antecedentes Personales*/
                nuevoPaciente.setRut(request.getParameter("txtRut"));
                nuevoPaciente.setNombre(request.getParameter("txtNombre"));
                nuevoPaciente.setSexo(request.getParameter("opSexo"));
                nuevoPaciente.setDomicilio(request.getParameter("txtDomicilio"));
                /* Rescato la fecha*/

                /*Edit Conny*/
                /*
                Rescato la fecha de nacimiento como un String desde datetimepicker
                y la convierto al formato que se necesita explícitamente
                no cambie nada de lo que habían puesto con date formatter 
                solo agregué la variable fechaNacimiento y vectFechas
                 */
                String fecha = request.getParameter("txtFechaNacimineto");
                String[] vectFecha = fecha.split(" de ");
                //d.getMes obtiene el número del mes
                String fechaNacimiento = "";
                try {
                    fechaNacimiento = vectFecha[2] + "-" + d.getMes(vectFecha[1].toLowerCase()) + "-" + vectFecha[0];
                } catch (Exception e) {
                    request.getRequestDispatcher("crearFicha.jsp?m=2").forward(request, response);
                }

                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                Date date = null;
                try {
                    //aquí cambie la variable
                    date = formatter.parse(fechaNacimiento);
                } catch (ParseException ex) {
                    Logger.getLogger(CrearFichaServlet.class.getName()).log(Level.SEVERE, null, ex);
                }

                nuevoPaciente.setFechaNacimiento(Data.dateToTimeStamp(date));
                nuevoPaciente.setEstadoCivil(Integer.parseInt(request.getParameter("cboEstadoCivil")));
                nuevoPaciente.setActividad(request.getParameter("txtActividad"));
                nuevoPaciente.setTelefonos(request.getParameter("txtTelefonos"));

                //------------------------------------------------------------------------------------------
                /*Antecedentes Morbidos*/
                nuevaFicha.setUsuario(Integer.parseInt(request.getParameter("txtUsuario")));
                nuevaFicha.setHta(Integer.parseInt(request.getParameter("cboHTA")));
                nuevaFicha.setDm(Integer.parseInt(request.getParameter("cboDM")));
                
                try {
                    nuevaFicha.setTipoDiabetes(Integer.parseInt(request.getParameter("cboTipo")));
                } catch (Exception e) {
                    nuevaFicha.setTipoDiabetes(0);
                }

                String anio = request.getParameter("txtAnioEvolucion");

                if (!anio.trim().equals("")) {
                    nuevaFicha.setAniosEvolucion(Integer.parseInt(request.getParameter("txtAnioEvolucion")));
                } else {
                    nuevaFicha.setAniosEvolucion(0);
                }

                nuevaFicha.setMixto(Boolean.parseBoolean(request.getParameter("cboPcteMixto")));
                nuevaFicha.setControl(Boolean.parseBoolean(request.getParameter("cboControl")));

                nuevaFicha.setFarmacoterapia(request.getParameter("txtFarmacoterapia"));
                nuevaFicha.setOtros(request.getParameter("txtOtras"));
                nuevaFicha.setAlteracion(request.getParameter("txtAlter"));
                nuevaFicha.setHabitos(request.getParameter("txtHabitosNocivos"));
                //------------------------------------------------------------------------------------------

                /*Examen Fisicos General*/
                nuevaFicha.setTalla(Float.parseFloat(request.getParameter("txtTalla")));
                nuevaFicha.setImc(Float.parseFloat(request.getParameter("txtIMC")));
                //Amputacion
                nuevaFicha.setAmputacion(Boolean.parseBoolean(request.getParameter("cboAmputacion")));;
                nuevaFicha.setUbiAmputacion(request.getParameter("txtUbicacionAmputacion"));

                nuevaFicha.setnCalzado(Integer.parseInt(request.getParameter("txtNumCalzado")));
                nuevaFicha.setVarices(Boolean.parseBoolean(request.getParameter("cboVaricesExtremoInferior")));
                //Heridas
                nuevaFicha.setHeridas(Boolean.parseBoolean(request.getParameter("cboHeridas")));
                nuevaFicha.setUbiHeridas(request.getParameter("txtUbicacionHeridas"));
                nuevaFicha.setTipoHerida(request.getParameter("txtTipoHeridas"));
                
                try {
                    nuevaFicha.setTratamiento(Boolean.parseBoolean(request.getParameter("cboTratamiento")));
                } catch (Exception e) {
                    nuevaFicha.setTratamiento(false);
                }
                
                //Nevos
                nuevaFicha.setNevos(Boolean.parseBoolean(request.getParameter("cboNevos")));
                nuevaFicha.setUbiNevos(request.getParameter("txtUbicacionNevos"));
                //Masculas
                nuevaFicha.setTratamiento(Boolean.parseBoolean(request.getParameter("cboMaculas")));
                nuevaFicha.setTipoMaculas(request.getParameter("txtTipoMaculas"));
                //------------------------------------------------------------------------------------------

                d.crearFicha(nuevoPaciente, nuevaFicha);

                response.sendRedirect("crearFicha.jsp?m=1");

            } catch (SQLException ex) {
                Logger.getLogger(CrearFichaServlet.class
                        .getName()).log(Level.SEVERE, null, ex);

            } catch (ClassNotFoundException ex) {
                Logger.getLogger(CrearFichaServlet.class
                        .getName()).log(Level.SEVERE, null, ex);
            }
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
