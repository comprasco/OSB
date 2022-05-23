xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/sp/VerificarLimiteConsumoUsuario";
(:: import schema at "../Schemas/VerificarLimiteConsumoUsuario_sp.xsd" ::)
declare variable $IdUsuario as xs:string external;
declare variable $ServicioProxy as xs:string external;

declare function local:func($IdUsuario as xs:string, $ServicioProxy as xs:string) as element() (:: schema-element(ns1:InputParameters) ::) {
    <ns1:InputParameters>
        <ns1:P_ID_USUARIO>{fn:data($IdUsuario)}</ns1:P_ID_USUARIO>
        <ns1:P_SERVICIO_PROXY>{fn:data($ServicioProxy)}</ns1:P_SERVICIO_PROXY>
    </ns1:InputParameters>
};

local:func($IdUsuario,$ServicioProxy)
