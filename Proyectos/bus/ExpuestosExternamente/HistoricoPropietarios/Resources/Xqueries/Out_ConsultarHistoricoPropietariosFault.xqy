xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/services/bachue/cb/SBB_CB_HistoricoPropietarios/consultarHistoricoPropietarios/v1";
(:: import schema at "../Schemas/EE_HP_consultarHistoricoPropietarios.xsd" ::)

declare variable $codigo as xs:string external;
declare variable $mensaje as xs:string external;

declare function local:func($codigo as xs:string, $mensaje as xs:string) as element() (:: schema-element(ns1:salidaConsultarHistoricoPropietarios) ::) {
    <ns1:salidaConsultarHistoricoPropietarios>
        <ns1:codMensaje>{fn:data($codigo)}</ns1:codMensaje>
        <ns1:descripcionMensaje>{fn:data($mensaje)}</ns1:descripcionMensaje>
    </ns1:salidaConsultarHistoricoPropietarios>
};

local:func($codigo,$mensaje)
