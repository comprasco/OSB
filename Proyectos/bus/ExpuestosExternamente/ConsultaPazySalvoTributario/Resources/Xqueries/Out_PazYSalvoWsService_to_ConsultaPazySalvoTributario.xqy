xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://ws.saimyr.com.co/";
(:: import schema at "../Schemas/Legacy/PazYSalvoWsService.xsd" ::)
declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/ee/consultapazysalvotributario/consultarpazysalvotributario/v1";
(:: import schema at "../Schemas/EE_CPST_ConsultarPazySalvoTributario.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:generarPysVurResponse) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:generarPysVurResponse) ::)) as element() (:: schema-element(ns2:salidaConsultarPazySalvoTributario) ::) {
    <ns2:salidaConsultarPazySalvoTributario>
        {
            if ($payloadResponse/return/filePyS)
            then <ns2:pdfCertificado>{fn:data($payloadResponse/return/filePyS)}</ns2:pdfCertificado>
            else ()
        }
               
        {
            if (fn:data($payloadResponse/return/errorCode = '0') and ($payloadResponse/return/filePyS/text()!=''))then
        <ns2:codigoMensaje>{'200'}</ns2:codigoMensaje> else
        <ns2:codigoMensaje>{'409'}</ns2:codigoMensaje>
        }
        
        {
            if (fn:data($payloadResponse/return/errorCode = '0')and ($payloadResponse/return/filePyS/text()!=''))then
        <ns2:descripcionMensaje>{'OK'}</ns2:descripcionMensaje> else
        <ns2:descripcionMensaje>{fn:data($payloadResponse/return/mensajeError)}</ns2:descripcionMensaje>
        }
       
    </ns2:salidaConsultarPazySalvoTributario>
};
local:func($payloadResponse)
