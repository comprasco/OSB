xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://ws.servicios.corebachue.bachue.supernotariado.gov.co/";
(:: import schema at "../Schemas/Legacy/BiometriaController.xsd" ::)
declare variable $codigo as xs:string external;
declare variable $mensaje as xs:string external;


declare function local:func($codigo as xs:string, $mensaje as xs:string) as element() (:: schema-element(ns1:eliminarFirmaResponse) ::) {
    <ns1:eliminarFirmaResponse>
        <eliminarFirmaResponse>
            <codigo>{fn:data($codigo)}</codigo>
            <mensaje>{fn:data($mensaje)}</mensaje>
            <resultado></resultado>
        </eliminarFirmaResponse>
    </ns1:eliminarFirmaResponse>
};

local:func($codigo,$mensaje)
