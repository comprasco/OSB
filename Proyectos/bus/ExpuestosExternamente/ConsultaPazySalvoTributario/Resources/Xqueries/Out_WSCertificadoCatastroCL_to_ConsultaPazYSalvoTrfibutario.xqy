xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://facade.uaecd.gov.co/";
(:: import schema at "../WSDLs/BS_WSCertificadoCatastralCL_11001.wsdl" ::)
declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/ee/consultapazysalvotributario/consultarpazysalvotributario/v1";
(:: import schema at "../Schemas/EE_CPST_ConsultarPazySalvoTributario.xsd" ::)

declare namespace ns3 = "http://facade.uaecd.gov.co/types/";

declare variable $payloadResponse as element() (:: schema-element(ns1:getCertificadoResponseElement) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:getCertificadoResponseElement) ::)) as element() (:: schema-element(ns2:salidaConsultarPazySalvoTributario) ::) {
    <ns2:salidaConsultarPazySalvoTributario>
    
        <ns2:pdfCertificado>{fn:data($payloadResponse/ns1:result/ns3:pdfCertificado)}</ns2:pdfCertificado>
      
        {
            if (fn:data($payloadResponse/ns1:result/ns3:pdfCertificado) )  then
        <ns2:codigoMensaje>{'200'}</ns2:codigoMensaje>
        else <ns2:codigoMensaje>{'500'}</ns2:codigoMensaje>
        }
        {
            if (fn:data($payloadResponse/ns1:result/ns3:pdfCertificado)) then
        <ns2:descripcionMensaje>{'OK'}</ns2:descripcionMensaje>
         else <ns2:descripcionMensaje>{'Excepción no controlada'}</ns2:descripcionMensaje>
        }
       
        
        
    </ns2:salidaConsultarPazySalvoTributario>
};

local:func($payloadResponse)
