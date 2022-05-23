xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/co/consultapoderes/consultarpoder/v1";
(:: import schema at "../Schemas/Legacy/CO_CP_ConsultarPoder.xsd" ::)
declare variable $codigoMensaje as xs:string external;
declare variable $descripcionMensaje as xs:string external;

declare function local:func($codigoMensaje as xs:string, $descripcionMensaje as xs:string) as element() (:: schema-element(ns1:salidaConsultarPoder) ::) {
    <ns1:salidaConsultarPoder>
        <ns1:documentos>
            <ns1:documento>
                <ns1:dID></ns1:dID>
                <ns1:docName></ns1:docName>
                <ns1:x_Justificacion_Revocado></ns1:x_Justificacion_Revocado>
                <ns1:x_Tipo_Poder></ns1:x_Tipo_Poder>
                <ns1:xDepartamentos></ns1:xDepartamentos>
                <ns1:xMunicipios></ns1:xMunicipios>
                <ns1:xTip_Doc_Apoderado></ns1:xTip_Doc_Apoderado>
                <ns1:xNotaria></ns1:xNotaria>
                <ns1:xCC_Apoderado></ns1:xCC_Apoderado>
                <ns1:xNombre_Apoderado></ns1:xNombre_Apoderado>
                <ns1:xTip_Doc_Poderdante></ns1:xTip_Doc_Poderdante>
                <ns1:xCC_Poderdante></ns1:xCC_Poderdante>
                <ns1:xNombre_Poderdante></ns1:xNombre_Poderdante>
                <ns1:xNum_Matricula_Poder></ns1:xNum_Matricula_Poder>
                <ns1:xDireccion_Predio></ns1:xDireccion_Predio>
                <ns1:xDepartamento_Predio></ns1:xDepartamento_Predio>
                <ns1:xCiudad_Predio></ns1:xCiudad_Predio>
                <ns1:xNumero_Instrumento></ns1:xNumero_Instrumento>
                <ns1:xFecha_Instrumento></ns1:xFecha_Instrumento>
                <ns1:xEstado_Poder></ns1:xEstado_Poder>
                <ns1:xUso_Poder></ns1:xUso_Poder>
                <ns1:xCirculo_Predio></ns1:xCirculo_Predio>
                <ns1:xFinalizacion_Poder></ns1:xFinalizacion_Poder>
                <ns1:xJustificacion_Usado></ns1:xJustificacion_Usado>
                <ns1:xFecha_cargue_poder></ns1:xFecha_cargue_poder>
                <ns1:urlVisor></ns1:urlVisor>
                <ns1:codigoMensaje>{fn:data($codigoMensaje)}</ns1:codigoMensaje>
                {
                if ($codigoMensaje = '500')
                then <ns1:descripcionMensaje>Excepción no controlada</ns1:descripcionMensaje> 
                else(
                 <ns1:descripcionMensaje>{fn:data($descripcionMensaje)}</ns1:descripcionMensaje>)
                }
            </ns1:documento>
        </ns1:documentos>
    </ns1:salidaConsultarPoder>
};

local:func($codigoMensaje,$descripcionMensaje)
