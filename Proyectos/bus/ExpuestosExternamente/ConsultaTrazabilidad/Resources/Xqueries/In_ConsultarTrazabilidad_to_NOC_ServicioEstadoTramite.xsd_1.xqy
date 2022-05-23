xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)
declare namespace dvm="http://www.oracle.com/osb/xpath-functions/dvm";
declare namespace ns2="http://glass.aac.step.org/";
(:: import schema at "../Schemas/Legacy/ServicioEstadoTramite.xsd_1.xsd" ::)
declare namespace ns1="http://www.gobiernoenlinea.gov.co/GEL-XML/1.0/schemas/integracion/supernotariado/bachue";
(:: import schema at "../Schemas/EE_CT_ConsultarTrazabilidadNOC.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:entradaTrazabilidadTramiteRegistroNodoCentral) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:entradaTrazabilidadTramiteRegistroNodoCentral) ::)) as element() (:: schema-element(ns2:consultaEstadoTramite) ::) {
    <ns2:consultaEstadoTramite>
        <entrada>
            <circulo>{fn:data($payloadRequest/codCirculoRegisral)}</circulo>
            <numeroTurno>{fn:data($payloadRequest/radicacion)}</numeroTurno>
            <sistemaUsuario></sistemaUsuario>
        </entrada>
        <sistemaUsuario>{fn:string(dvm:lookup('ExpuestosExternamente/LoginNOC/DVM/Login_NOC', 'Llave', 'User', 'Valor', ''))}</sistemaUsuario>
        <claveSistemaUsuario>{fn:string(dvm:lookup('ExpuestosExternamente/LoginNOC/DVM/Login_NOC', 'Llave', 'Password', 'Valor', ''))}</claveSistemaUsuario>
    </ns2:consultaEstadoTramite>
};

local:func($payloadRequest)
