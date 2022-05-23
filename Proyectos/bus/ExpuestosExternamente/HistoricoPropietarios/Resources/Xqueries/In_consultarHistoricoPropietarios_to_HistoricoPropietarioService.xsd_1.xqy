xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)
declare namespace dvm="http://www.oracle.com/osb/xpath-functions/dvm";
declare namespace ns2="http://historicopropietarios.snr.gov.co/";
(:: import schema at "../Schemas/Legacy/HistoricoPropietarioService.xsd_1.xsd" ::)
declare namespace v1="https://www.supernotariado.gov.co/services/bachue/cb/SBB_CB_HistoricoPropietarios/consultarHistoricoPropietarios/v1";
(:: import schema at "../Schemas/EE_HP_consultarHistoricoPropietarios.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(v1:entradaConsultarHistoricoPropietarios) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(v1:entradaConsultarHistoricoPropietarios) ::)) as element() (:: schema-element(ns2:consultarHistoricoPropietario) ::) {
    <ns2:consultarHistoricoPropietario>
        <entrada>
           
            <circulo>{fn:substring(fn:data($payloadRequest/v1:numIdentificacionPredio), 0, 4)}</circulo>
            <numeroDocumento></numeroDocumento>
            <numeroMatricula>{fn:substring(fn:data($payloadRequest/v1:numIdentificacionPredio),4)}</numeroMatricula>
           
            <password>{fn:string(dvm:lookup('ExpuestosExternamente/LoginNOC/DVM/Login_NOC', 'Llave', 'Password', 'Valor', ''))}
</password>
            <primerApellido></primerApellido>
            <primerNombre></primerNombre>
            <razonSocial></razonSocial>
            <segundoApellido></segundoApellido>
            <segundoNombre></segundoNombre>
            <sistemaUsuario>{fn:string(dvm:lookup('ExpuestosExternamente/LoginNOC/DVM/Login_NOC', 'Llave', 'User', 'Valor', ''))}</sistemaUsuario>
            <tipoDocumento></tipoDocumento>
        </entrada>
    </ns2:consultarHistoricoPropietario>
};

local:func($payloadRequest)
