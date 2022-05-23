xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)
declare namespace dvm="http://www.oracle.com/osb/xpath-functions/dvm";
declare namespace ns2="http://servgenpdfconsultaj.ubi.com.co/";
(:: import schema at "../Schemas/Legacy/ServicioGeneraPDFConsultaJuridica.xsd_1.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/services/bachue/ee/cb/certificadotradicionpdf/obtenerPDF/v1";
(:: import schema at "../Schemas/EE_CTP_obtenerPDF.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:entradaCertificadoTradicionPDF) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:entradaCertificadoTradicionPDF) ::)) as element() (:: schema-element(ns2:obtenerConsultaJuridica) ::) {
    <ns2:obtenerConsultaJuridica>
        <entrada>
            <circulo>{fn:substring(fn:data($payloadRequest/ns1:numIdentificacionPredio), 0, 4)}</circulo>
            <ciudadEntidad></ciudadEntidad>
            <entidad></entidad>
            <ipConsulta></ipConsulta>
            <nombreUsuario></nombreUsuario>
            <numeroMatricula>{fn:substring(fn:data($payloadRequest/ns1:numIdentificacionPredio),4)}</numeroMatricula>
            
            <sistemaUsuario>{fn:string(dvm:lookup('ExpuestosExternamente/LoginNOC/DVM/Login_NOC', 'Llave', 'User', 'Valor', ''))}</sistemaUsuario>
        </entrada>
    </ns2:obtenerConsultaJuridica>
};

local:func($payloadRequest)