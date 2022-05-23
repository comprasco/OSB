xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/cb/gestionalertastitulares/validarsolicitudalertamasiva/v1";
(:: import schema at "../Schemas/Legacy/CB_GAT_ValidarSolicitudAlertaMasiva.xsd" ::)
declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/ee/gestionalertastitulares/validarsolicitudalertamasiva/v1";
(:: import schema at "../Schemas/EE_GAT_ValidarSolicitudAlertaMasiva.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:salidaValidarSolicitudAlertaMasiva) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:salidaValidarSolicitudAlertaMasiva) ::)) as element() (:: schema-element(ns2:salidaValidarSolicitudAlertaMasiva) ::) {
    <ns2:salidaValidarSolicitudAlertaMasiva>
        <ns2:archivo>{fn:data($payloadResponse/ns1:archivo)}</ns2:archivo>
        <ns2:codigoMensaje>{fn:data($payloadResponse/ns1:codigoMensaje)}</ns2:codigoMensaje>
        {
            if ($payloadResponse/ns1:descripcionMensaje)
            then <ns2:descripcionMensaje>{fn:data($payloadResponse/ns1:descripcionMensaje)}</ns2:descripcionMensaje>
            else ()
        }
        
    </ns2:salidaValidarSolicitudAlertaMasiva>
};

local:func($payloadResponse)