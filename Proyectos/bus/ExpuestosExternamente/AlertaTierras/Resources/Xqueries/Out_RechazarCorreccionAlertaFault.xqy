xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/ee/alertaTierras/rechazarCorreccionAlerta/v1";
(:: import schema at "../Schemas/Legacy/EE_CC_RechazarCorreccionAlerta.xsd" ::)

declare variable $codigo as xs:string external;
declare variable $mensaje as xs:string external;
declare function local:func($codigo as xs:string, $mensaje as xs:string) as element() (:: schema-element(ns1:salidaRechazarCorreccionAlerta) ::) {
    <ns1:salidaRechazarCorreccionAlerta>
            <ns1:codigo>{fn:data($codigo)}</ns1:codigo>
            <ns1:mensaje>{fn:data($mensaje)}</ns1:mensaje>
    </ns1:salidaRechazarCorreccionAlerta>
};

local:func($codigo,$mensaje)

