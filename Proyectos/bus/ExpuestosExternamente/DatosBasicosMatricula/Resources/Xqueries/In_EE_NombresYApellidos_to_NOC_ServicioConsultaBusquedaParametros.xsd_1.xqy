xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)
declare namespace dvm="http://www.oracle.com/osb/xpath-functions/dvm";
declare namespace ns2="http://glass.aac.step.org/";
(:: import schema at "../Schemas/Legacy/ServicioConsultaBusquedaParametros.xsd_1.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/EE/v1";
(:: import schema at "../Schemas/Legacy/NombresYApellidos.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:Root) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:Root) ::)) as element() (:: schema-element(ns2:ejecutarBusqueda) ::) {
    <ns2:ejecutarBusqueda>
     <entrada>
            <tipoLstCertificadoTradiciLibertEnt>
                <ubicacionMatriculaSistemaSNR>
                    <nomPersonaRelacionadoMatriculaInmobiliaria>
                        <primerApellido>{fn:data($payloadRequest/ns1:primerApellido)}</primerApellido>
                        <primerNombre>{fn:data($payloadRequest/ns1:primerNombre)}</primerNombre>
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
                    </nomPersonaRelacionadoMatriculaInmobiliaria>
                </ubicacionMatriculaSistemaSNR>
            </tipoLstCertificadoTradiciLibertEnt>
        </entrada>
        <sistemaUsuario>{fn:string(dvm:lookup('ExpuestosExternamente/LoginNOC/DVM/Login_NOC', 'Llave', 'User', 'Valor', ''))}</sistemaUsuario>
        <clave>{fn:string(dvm:lookup('ExpuestosExternamente/LoginNOC/DVM/Login_NOC', 'Llave', 'Password', 'Valor', ''))}</clave>
    </ns2:ejecutarBusqueda>
};

local:func($payloadRequest)
