xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)
declare namespace dvm="http://www.oracle.com/osb/xpath-functions/dvm";
declare namespace ns2="http://historicopropietarios.snr.gov.co/";
(:: import schema at "../Schemas/Legacy/HistoricoPropietarioService.xsd_1.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/services/bachue/ee/cb/SBB_CB_HistoricoPropietarios/consultarHistoricoPropiedades/v1";
(:: import schema at "../Schemas/EE_HP_consultarHistoricoPropiedades.xsd" ::)
declare variable $payloadRequest as element() (:: schema-element(ns1:entradaConsultarHistoricoPropiedades) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:entradaConsultarHistoricoPropiedades) ::)) as element() (:: schema-element(ns2:consultarHistoricoPropietario) ::) {
    <ns2:consultarHistoricoPropietario>
        <entrada>
            <circulo></circulo>
            {
                if ($payloadRequest/ns1:numDocumentoPersona)
                then <numeroDocumento>{fn:data($payloadRequest/ns1:numDocumentoPersona)}</numeroDocumento>
                else ()
            }
            <numeroMatricula></numeroMatricula>
            <password>{fn:string(dvm:lookup('ExpuestosExternamente/LoginNOC/DVM/Login_NOC', 'Llave', 'Password', 'Valor', ''))}</password>
         
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
                if ($payloadRequest/ns1:segundoApellido)
                then <segundoApellido>{fn:data($payloadRequest/ns1:segundoApellido)}</segundoApellido>
                else ()
            }
            {
                if ($payloadRequest/ns1:segundoNombre)
                then <segundoNombre>{fn:data($payloadRequest/ns1:segundoNombre)}</segundoNombre>
                else ()
            }
            <sistemaUsuario>{fn:string(dvm:lookup('ExpuestosExternamente/LoginNOC/DVM/Login_NOC', 'Llave', 'User', 'Valor', ''))}</sistemaUsuario>
            {
                if ($payloadRequest/ns1:tipoDocumentoPersona)
                then <tipoDocumento>{fn:data($payloadRequest/ns1:tipoDocumentoPersona)}</tipoDocumento>
                else (
                  if ($payloadRequest/ns1:numNIT)
                  then <tipoDocumento>{fn:data($payloadRequest/ns1:numNIT)}</tipoDocumento>
                  else ()
                )
            }   
        </entrada>
    </ns2:consultarHistoricoPropietario>
};

local:func($payloadRequest)
