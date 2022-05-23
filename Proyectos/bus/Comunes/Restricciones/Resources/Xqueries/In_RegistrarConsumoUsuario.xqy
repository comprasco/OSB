xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace reg="http://xmlns.oracle.com/pcbpel/adapter/db/sp/RegistrarConsumoUsuario";
(:: import schema at "../Schemas/RegistrarConsumoUsuario_sp.xsd" ::)
declare variable $IdUsuario as xs:string external;
declare variable $ServicioProxy as xs:string external;

declare function local:func($IdUsuario as xs:string, $ServicioProxy as xs:string) as element() (:: schema-element(reg:InputParameters) ::) {
    <reg:InputParameters>
        <reg:P_ID_USUARIO>{fn:data($IdUsuario)}</reg:P_ID_USUARIO>
        <reg:P_SERVICIO_PROXY>{fn:data($ServicioProxy)}</reg:P_SERVICIO_PROXY>
    </reg:InputParameters>
};

local:func($IdUsuario,$ServicioProxy)
