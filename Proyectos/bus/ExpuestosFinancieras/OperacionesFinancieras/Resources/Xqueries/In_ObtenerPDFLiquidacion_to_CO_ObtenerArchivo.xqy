xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/co/busquedadocumentos/obtenerarchivo/v1";
(:: import schema at "../../../../ConsumidosInternamente/BusquedaDocumentos/Resources/Schemas/Legacy/CO_BD_ObtenerArchivo.xsd" ::)

declare variable $dID as xs:string external;
declare function local:func($dID as xs:string) as element() (:: schema-element(ns1:entradaObtenerArchivo) ::) {
    <ns1:entradaObtenerArchivo>
        <ns1:dDocName></ns1:dDocName>
        <ns1:dID>{fn:data($dID)}</ns1:dID>
    </ns1:entradaObtenerArchivo>
};

local:func($dID)
