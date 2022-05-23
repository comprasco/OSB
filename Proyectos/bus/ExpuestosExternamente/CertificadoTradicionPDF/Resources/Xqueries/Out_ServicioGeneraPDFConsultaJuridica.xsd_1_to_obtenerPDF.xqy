xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://servgenpdfconsultaj.ubi.com.co/";
(:: import schema at "../Schemas/Legacy/ServicioGeneraPDFConsultaJuridica.xsd_1.xsd" ::)
declare namespace ns2="https://www.supernotariado.gov.co/services/bachue/ee/cb/certificadotradicionpdf/obtenerPDF/v1";
(:: import schema at "../Schemas/EE_CTP_obtenerPDF.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:obtenerConsultaJuridicaResponse) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:obtenerConsultaJuridicaResponse) ::)) as element() (:: schema-element(ns2:salidaCertificadoTradicionPDF) ::) {
    <ns2:salidaCertificadoTradicionPDF>
        {
            if ($payloadResponse/return/pdf)
            then <ns2:datosArchivoPDF>{fn:data($payloadResponse/return/pdf)}</ns2:datosArchivoPDF>
            else ()
        }
        <ns2:codMensaje>{fn:data($payloadResponse/return/codigoResultado)}</ns2:codMensaje>
        {
            if ($payloadResponse/return/logResultadoConsulta/mensaje)
            then <ns2:descripcionMensaje>{fn:data($payloadResponse/return/logResultadoConsulta/mensaje)}</ns2:descripcionMensaje>
            else ()
        }
       
    </ns2:salidaCertificadoTradicionPDF>
};

local:func($payloadResponse)