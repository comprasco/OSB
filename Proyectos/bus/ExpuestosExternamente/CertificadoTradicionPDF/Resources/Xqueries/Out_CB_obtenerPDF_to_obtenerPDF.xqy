xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/services/bachue/cb/certificadotradicionpdf/obtenerPDF/v1";
(:: import schema at "../Schemas/Legacy/CB_CTPDF_obtenerPDF.xsd" ::)
declare namespace ns2="https://www.supernotariado.gov.co/services/bachue/ee/cb/certificadotradicionpdf/obtenerPDF/v1";
(:: import schema at "../Schemas/EE_CTP_obtenerPDF.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:salidaCertificadoTradicionPDF) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:salidaCertificadoTradicionPDF) ::)) as element() (:: schema-element(ns2:salidaCertificadoTradicionPDF) ::) {
    <ns2:salidaCertificadoTradicionPDF>
        {
            if ($payloadResponse/ns1:datosArchivoPDF)
            then <ns2:datosArchivoPDF>{fn:data($payloadResponse/ns1:datosArchivoPDF)}</ns2:datosArchivoPDF>
            else ()
        }
        <ns2:codMensaje>{fn:data($payloadResponse/ns1:codMensaje)}</ns2:codMensaje>
        {
            if ($payloadResponse/ns1:descripcionMensaje)
            then <ns2:descripcionMensaje>{fn:data($payloadResponse/ns1:descripcionMensaje)}</ns2:descripcionMensaje>
            else ()
        }
    </ns2:salidaCertificadoTradicionPDF>
};

local:func($payloadResponse)