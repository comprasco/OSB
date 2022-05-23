xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://glass.aac.step.org/";
(:: import schema at "../Schemas/Legacy/ServicioConsultaCertificadoTradicion.xsd_1.xsd" ::)
declare namespace dvm="http://www.oracle.com/osb/xpath-functions/dvm";
declare variable $circulo as xs:string external;
declare variable $numeroMatriculaInmobiliariaPredio as xs:string external;
declare function local:func($circulo as xs:string, $numeroMatriculaInmobiliariaPredio as xs:string) as element() (:: schema-element(ns1:ejecutar) ::) {
    <ns1:ejecutar>
        <entrada>
            <tipoCirculoRegistral>
                <departamentoCirculoRegistral>
                </departamentoCirculoRegistral>
                <jurisdiccionPredio>{fn:data($circulo)}</jurisdiccionPredio>
            </tipoCirculoRegistral>
            <ubicacionMatriculaSistemaSNR>
                <numeroMatriculaInmobiliariaPredio>{fn:data($numeroMatriculaInmobiliariaPredio)}</numeroMatriculaInmobiliariaPredio>
            </ubicacionMatriculaSistemaSNR>
        </entrada>
	<sistemaUsuario>{fn:string(dvm:lookup('ExpuestosExternamente/LoginNOC/DVM/Login_NOC', 'Llave', 'User', 'Valor', ''))}</sistemaUsuario>
	<clave>{fn:string(dvm:lookup('ExpuestosExternamente/LoginNOC/DVM/Login_NOC', 'Llave', 'Password', 'Valor', ''))}</clave>
    </ns1:ejecutar>
};

local:func($circulo,$numeroMatriculaInmobiliariaPredio)
