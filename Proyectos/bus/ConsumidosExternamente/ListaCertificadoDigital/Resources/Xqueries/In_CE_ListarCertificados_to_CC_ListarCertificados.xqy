xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://TargetNamespace.com/ServiceName";
(:: import schema at "../Schemas/Legacy/CC_LCD_ListarCertificadosEntrada.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/ce/listacertificadodigital/listarcertificados/v1";
(:: import schema at "../Schemas/CE_LCD_ListarCertificados.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:entradaListarCertificados) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:entradaListarCertificados) ::)) as element() (:: schema-element(ns2:Root-Element) ::) {
    <ns2:Root-Element>
        <ns2:nuip>{fn:data($payloadRequest/ns1:numDocumento)}</ns2:nuip>
        <ns2:password>{fn:data($payloadRequest/ns1:contraseña)}</ns2:password>
    </ns2:Root-Element>
};

local:func($payloadRequest)
