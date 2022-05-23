xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/ce/consulta_ANI_RNEC/consultarCedulas/v1";
(:: import schema at "../Schemas/CE_CAR_ConsultarCedulas.xsd" ::)
declare variable $codigo as xs:string external;
declare variable $mensaje as xs:string external;

declare function local:func($codigo as xs:string, $mensaje as xs:string) as element() (:: schema-element(ns1:salidaConsultarCedulas) ::) {
    <ns1:salidaConsultarCedulas>
        <ns1:codigo>{fn:data($codigo)}</ns1:codigo>
        <ns1:mensaje>{fn:data($mensaje)}</ns1:mensaje>
    </ns1:salidaConsultarCedulas>
};

local:func($codigo,$mensaje)
