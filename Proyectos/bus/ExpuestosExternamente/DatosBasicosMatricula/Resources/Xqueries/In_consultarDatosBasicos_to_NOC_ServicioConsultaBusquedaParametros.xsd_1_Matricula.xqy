xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)
declare namespace dvm="http://www.oracle.com/osb/xpath-functions/dvm";
declare namespace ns2="http://glass.aac.step.org/";
(:: import schema at "../Schemas/Legacy/ServicioConsultaBusquedaParametros.xsd_1.xsd" ::)
declare namespace ns1="http://www.gobiernoenlinea.gov.co/GEL-XML/1.0/schemas/integracion/supernotariado/bachue";
(:: import schema at "../Schemas/EE_DBM_consultarDatosBasicos.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:entradaDatosBasicos) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:entradaDatosBasicos) ::)) as element() (:: schema-element(ns2:ejecutarBusqueda) ::) {
    <ns2:ejecutarBusqueda>
   
    
            
        <entrada>
            
            <tipoLstCertificadoTradiciLibertEnt>
                
                <tipoCirculoRegistral>
                    {
                    if ($payloadRequest/ns1:criterioBusqueda='matricula') then <jurisdiccionPredio>{fn:substring(fn:data($payloadRequest/ns1:valorCriterioBusqueda), 0, 4)}</jurisdiccionPredio>
                    else()
                    }
                </tipoCirculoRegistral>
                <ubicacionMatriculaSistemaSNR>
                    
                     {
                    if ($payloadRequest/ns1:criterioBusqueda='matricula') then <numeroMatriculaInmobiliariaPredio>{fn:substring(fn:data($payloadRequest/ns1:valorCriterioBusqueda),4)}</numeroMatriculaInmobiliariaPredio>
                    else()
                    }  
                </ubicacionMatriculaSistemaSNR>
            </tipoLstCertificadoTradiciLibertEnt>
        </entrada>
        <sistemaUsuario>{fn:string(dvm:lookup('ExpuestosExternamente/LoginNOC/DVM/Login_NOC', 'Llave', 'User', 'Valor', ''))}</sistemaUsuario>
        <clave>{fn:string(dvm:lookup('ExpuestosExternamente/LoginNOC/DVM/Login_NOC', 'Llave', 'Password', 'Valor', ''))}</clave>
    </ns2:ejecutarBusqueda>
};

local:func($payloadRequest)