xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://TargetNamespace.com/ServiceName";
(:: import schema at "../Schemas/Legacy/CC_LCD_ListarCertificados.xsd" ::)
declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/ce/listacertificadodigital/listarcertificados/v1";
(:: import schema at "../Schemas/CE_LCD_ListarCertificados.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:Root-Element) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:Root-Element) ::)) as element() (:: schema-element(ns2:salidaListarCertificados) ::) {
    <ns2:salidaListarCertificados>
        <ns2:nombreComun>{fn:data($payloadResponse/ns1:listCertificateResponse/ns1:cn)}</ns2:nombreComun>
        <ns2:nombreOrganizacion>{fn:data($payloadResponse/ns1:listCertificateResponse/ns1:o)}</ns2:nombreOrganizacion>
        <ns2:identificador>{fn:data($payloadResponse/ns1:listCertificateResponse/ns1:serialNumber)}</ns2:identificador>
        <ns2:unidadOrganizacional>{fn:data($payloadResponse/ns1:listCertificateResponse/ns1:ou)}</ns2:unidadOrganizacional>
        <ns2:serialCertificado>{fn:data($payloadResponse/ns1:listCertificateResponse/ns1:serial)}</ns2:serialCertificado>
        <ns2:issuer>{fn:data($payloadResponse/ns1:listCertificateResponse/ns1:issuer)}</ns2:issuer>
        <ns2:fechaEmision>{fn:data($payloadResponse/ns1:listCertificateResponse/ns1:validity/ns1:notBefore)}</ns2:fechaEmision>
        <ns2:fechaVencimiento>{fn:data($payloadResponse/ns1:listCertificateResponse/ns1:validity/ns1:notAfter)}</ns2:fechaVencimiento>
        <ns2:codigoMensaje>{fn:data($payloadResponse/ns1:errores/ns1:code)}</ns2:codigoMensaje>
        <ns2:descripcionMensaje>{fn:data($payloadResponse/ns1:errores/ns1:message)}</ns2:descripcionMensaje>
    </ns2:salidaListarCertificados>
};

local:func($payloadResponse)
