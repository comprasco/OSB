xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://facade.uaecd.gov.co/";
(:: import schema at "../WSDLs/BS_WSCertificadoCatastralCL_11001.wsdl" ::)
declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/ee/consultapazysalvotributario/consultarpazysalvotributario/v1";
(:: import schema at "../Schemas/EE_CPST_ConsultarPazySalvoTributario.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:entradaConsultarPazySalvoTributario) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:entradaConsultarPazySalvoTributario) ::)) as element() (:: schema-element(ns2:getCertificadoElement) ::) {
    <ns2:getCertificadoElement>
        <ns2:direccion>{fn:data($payloadRequest/ns1:direccion)}</ns2:direccion>
        <ns2:chip>{fn:data($payloadRequest/ns1:chip)}</ns2:chip>
        <ns2:cedulaCatastral>{fn:data($payloadRequest/ns1:referenciaCatastral)}</ns2:cedulaCatastral>
        <ns2:correousuario>{fn:data($payloadRequest/ns1:usuario)}</ns2:correousuario>
        <ns2:clave>{fn:data($payloadRequest/ns1:clave)}</ns2:clave>
        <ns2:ipRemoto>{fn:data($payloadRequest/ns1:ip)}</ns2:ipRemoto>
    </ns2:getCertificadoElement>
};

local:func($payloadRequest)
