<%@page import="alumno.Alumno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%!
    Alumno alumnos [] = new Alumno[10];
    int cont = 0;
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/estilo.css">
        <title>Formulario</title>
    </head>
    <body>
       <div class='form-datos'>
            <h4>Formulario</h4>
            
            <form action='index.jsp' method='post'>

                <input type='text'   class='controls' name='tfMatricula'       placeholder="Ingrese la matricula"> 
                <input type='text'   class='controls' name='tfNombre'          placeholder="Ingrese el nombre">
                <input type='text'   class='controls' name='tfApellidoPaterno' placeholder="Ingrese el apellido paterno">
                <input type='text'   class='controls' name='tfApellidoMaterno' placeholder="Ingrese el apellido materno"> 
                <input type='number' class='controls' name='tfDdi'             placeholder="Ingrese la calificación de DDI" > 
                <input type='number' class='controls' name='tfDwi'             placeholder="Ingrese la calificación de DWI">
                <input type='number' class='controls' name='tfEcbd'            placeholder="Ingrese la calificación de ECBD">
                    
                <button type='submit' class='botons' name='btnRegistrar'>Registrar</button>
            </form> 
        </div> 
        <%
            
            if(request.getParameter("btnRegistrar") != null)
            {
                alumnos[cont] = new Alumno();
                alumnos[cont].setMatricula(request.getParameter("tfMatricula"));
                alumnos[cont].setNombre(request.getParameter("tfNombre"));
                alumnos[cont].setApellidoPaterno(request.getParameter("tfApellidoPaterno"));
                alumnos[cont].setApellidoMaterno(request.getParameter("tfApellidoMaterno"));
                alumnos[cont].setDdi(Double.parseDouble(request.getParameter("tfDdi")));
                alumnos[cont].setDwi(Double.parseDouble(request.getParameter("tfDwi")));
                alumnos[cont].setEcbd(Double.parseDouble(request.getParameter("tfEcbd")));
                cont++;
                
                
            }
            
            if(request.getParameter("btnRegistrar") != null)
            {
                out.println(""
                            +"<div id='contenido'>"
                            + "<table class = 'tabla'>"
                            + "     <thead class='Datos' >"
                            + "     <tr>"
                            + "         <th>MATRICULA</th>"
                            + "         <th>NOMBRE</th>"
                            + "         <th>APELLIDO PATERNO</th>"
                            + "         <th>APELLIDO PATERNO</th>"
                            + "         <th>DDI</th>"
                            + "         <th>DWI</th>"
                            + "         <th>ECBD</th>"
                            + "         <th>PROM</th>"
                            + "     </tr>"
                            + " </thead>"
                            + "</div>"
                );
                for(int i = 0; i < cont; i++)
                {
                        out.println
                    (""
                            + "<tbody>"
                            +   "<tr>"
                            +       "<td>" + alumnos[i].getMatricula() + "</td>"
                            +       "<td>" + alumnos[i].getNombre() + "</td>"
                            +       "<td>" + alumnos[i].getApellidoPaterno() +"</td>"
                            +       "<td>" + alumnos[i].getApellidoMaterno() + "</td>"
                            +       "<td>" + alumnos[i].getDdi() + "</td>"
                            +       "<td>" + alumnos[i].getDwi() + "</td>"
                            +       "<td>" + alumnos[i].getEcbd() + "</td>"
                            +       "<td>" + alumnos[i].calcularPromedio(alumnos[i].getDdi(), alumnos[i].getDwi(), alumnos[i].getEcbd()) + "</td>"
                            +   "</tr>"
                            + "</tbody>"
                     );
                }
                out.println(""
                    + "</table>"
                );
            }
            
        %>
     
    </body>
</html>
