xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/ee/alertaTierras/consultarListaMatriculas/v1";
(:: import schema at "../Schemas/Legacy/EE_CC_ConsultarListaMatriculas.xsd" ::)

declare variable $codigo as xs:string external;
declare variable $mensaje as xs:string external;
declare function local:func($codigo as xs:string, $mensaje as xs:string) as element() (:: schema-element(ns1:salidaConsultarListaMatriculas) ::) {
    <ns1:salidaConsultarListaMatriculas>
            <ns1:codigo>{fn:data($codigo)}</ns1:codigo>
            <ns1:mensaje>{fn:data($mensaje)}</ns1:mensaje>
    </ns1:salidaConsultarListaMatriculas>
};

local:func($codigo,$mensaje)

