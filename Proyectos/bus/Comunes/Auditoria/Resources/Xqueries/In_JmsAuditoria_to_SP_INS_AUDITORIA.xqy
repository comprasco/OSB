xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://www.supernotariado.gov.co/schemas/bachue/auditoria/v1";
(:: import schema at "../Schemas/Auditoria.xsd" ::)
declare namespace ns2="http://xmlns.oracle.com/pcbpel/adapter/db/sp/dbAuditoriaOSB";
(:: import schema at "../Schemas/dbAuditoriaOSB_sp.xsd" ::)

declare variable $mensajeJMS as element() (:: schema-element(ns1:mensajeAuditoria) ::) external;

declare function local:func($mensajeJMS as element() (:: schema-element(ns1:mensajeAuditoria) ::)) as element() (:: schema-element(ns2:InputParameters) ::) {
    <ns2:InputParameters>
        <ns2:P_UUID_SOLICITUD>{fn:data($mensajeJMS/UUID)}</ns2:P_UUID_SOLICITUD>
        <ns2:P_TIPO_MENSAJE>{fn:data($mensajeJMS/tipoMensaje)}</ns2:P_TIPO_MENSAJE>
        <ns2:P_FECHA>{fn:data($mensajeJMS/fechaHora)}</ns2:P_FECHA>
        <ns2:P_TAMANO_SIMPLE>{fn:data($mensajeJMS/tamano)}</ns2:P_TAMANO_SIMPLE>
        {
            if ($mensajeJMS/terminal)
            then <ns2:P_TERMINAL>{fn:data($mensajeJMS/terminal)}</ns2:P_TERMINAL>
            else ()
        }
        <ns2:P_DOMINIO>{fn:data($mensajeJMS/dominio)}</ns2:P_DOMINIO>
        <ns2:P_USUARIO>{fn:data($mensajeJMS/usuario)}</ns2:P_USUARIO>
        <ns2:P_SERVICIO>{fn:data($mensajeJMS/servicio)}</ns2:P_SERVICIO>
        <ns2:P_OPERACION>{fn:data($mensajeJMS/operacion)}</ns2:P_OPERACION>
        <ns2:P_MENSAJE>{$mensajeJMS/mensaje}</ns2:P_MENSAJE>
    </ns2:InputParameters>
};

local:func($mensajeJMS)