xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)
declare namespace dvm="http://www.oracle.com/osb/xpath-functions/dvm";
declare namespace ns2="http://consultaindicespropietarios.snr.gov.co/";
(:: import schema at "../Schemas/Legacy/ConsultaIndicesPropietarios.xsd_1.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/services/bachue/ee/indicepropietarios/consultar/v1";
(:: import schema at "../Schemas/EE_IP_consultar.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:entradaIndicePropietarios) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:entradaIndicePropietarios) ::)) as element() (:: schema-element(ns2:consultar) ::) {
    <ns2:consultar>
        <arg0>
            <auditoriaEntidad>{fn:data($payloadRequest/ns1:auditoriaEntidad)}</auditoriaEntidad>
            <auditoriaUsuario>{fn:data($payloadRequest/ns1:auditoriaUsuario)}</auditoriaUsuario>
            <circulo>{fn:data($payloadRequest/ns1:codCirculoRegistral)}</circulo>
            <contrasena>{fn:string(dvm:lookup('ExpuestosExternamente/LoginNOC/DVM/Login_NOC', 'Llave', 'Password', 'Valor', ''))}</contrasena>
            {
                if ($payloadRequest/ns1:codDepartamento)
                then <departamento>{fn:data($payloadRequest/ns1:codDepartamento)}</departamento>
                else ()
            }
            <entidad>{fn:data($payloadRequest/ns1:entidad)}</entidad>
            <ip></ip>
            <matricula></matricula>
            {
                if ($payloadRequest/ns1:codMunicipio)
                then <municipio>{fn:data($payloadRequest/ns1:codMunicipio)}</municipio>
                else ()
            }
            {
                if ($payloadRequest/ns1:numDocumentoPersona)
                then <numeroDocumento>{fn:data($payloadRequest/ns1:numDocumentoPersona)}</numeroDocumento>
                else ()
            }
            {
                if ($payloadRequest/ns1:primerApellido)
                then <primerApellido>{fn:data($payloadRequest/ns1:primerApellido)}</primerApellido>
                else ()
            }
            {
                if ($payloadRequest/ns1:primerNombre)
                then <primerNombre>{fn:data($payloadRequest/ns1:primerNombre)}</primerNombre>
                else ()
            }
            {
                if ($payloadRequest/ns1:razonSocial)
                then <razonSocial>{fn:data($payloadRequest/ns1:razonSocial)}</razonSocial>
                else ()
            }
            {
                if ($payloadRequest/ns1:tipoIdentificacionPredio = 'numeroPredial')
                then <referenciaCatastral>{fn:data($payloadRequest/ns1:numIdentificacionPredio)}</referenciaCatastral>
                else ()
            }
            {
                if ($payloadRequest/ns1:segundoApellido)
                then <segundoApellido>{fn:data($payloadRequest/ns1:segundoApellido)}</segundoApellido>
                else ()
            }
            {
                if ($payloadRequest/ns1:segundoNombre)
                then <segundoNombre>{fn:data($payloadRequest/ns1:segundoNombre)}</segundoNombre>
                else ()
            }
            {
                if ($payloadRequest/ns1:tipoDocumentoPersona)
                then <tipoDocumento>{fn:data($payloadRequest/ns1:tipoDocumentoPersona)}</tipoDocumento>
                else ()
            }
            <usuario>{fn:string(dvm:lookup('ExpuestosExternamente/LoginNOC/DVM/Login_NOC', 'Llave', 'User', 'Valor', ''))}</usuario>
            <valorConsulta></valorConsulta>
        </arg0>
    </ns2:consultar>
};

local:func($payloadRequest)
