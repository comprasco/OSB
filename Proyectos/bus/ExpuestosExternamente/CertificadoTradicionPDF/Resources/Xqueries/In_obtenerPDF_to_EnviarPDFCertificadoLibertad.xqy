xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)
declare namespace dvm="http://www.oracle.com/osb/xpath-functions/dvm";
declare namespace ns2="http://enviarPDFCertificadoLibertad.ubi.com.co/";
(:: import schema at "../Schemas/Legacy/EnviarPDFCertificadoLibertad.xsd_1.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/services/bachue/ee/cb/certificadotradicionpdf/obtenerPDF/v1";
(:: import schema at "../Schemas/EE_CTP_obtenerPDF.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:entradaCertificadoTradicionPDF) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:entradaCertificadoTradicionPDF) ::)) as element() (:: schema-element(ns2:obtenerPDF) ::) {
    <ns2:obtenerPDF>
        <entrada>
            <banco>{'0'}</banco>
            <bancoCanalRecaudo></bancoCanalRecaudo>
            <canalRecaudo></canalRecaudo>
            <ciudadEntidad>{'Bachue'}</ciudadEntidad>
            <clave>{fn:string(dvm:lookup('ExpuestosExternamente/LoginNOC/DVM/Login_NOC', 'Llave', 'Password', 'Valor', ''))}</clave>
            <codigoCirculo>{fn:substring(fn:data($payloadRequest/ns1:numIdentificacionPredio),0,4)}</codigoCirculo>
            <cuentaCanalRecaudo></cuentaCanalRecaudo>
            <cus>{'0'}</cus>
            <email>{'PRUEBA@hotmail.com'}</email>
            <entidad>{'Bachue'}</entidad>
            <franquicia>{'0'}</franquicia>
            <lugarExpedicion>{'Bachue'}</lugarExpedicion>
            <medioPago></medioPago>
            <nombreUsuario>{'Bachue'}</nombreUsuario>
            <numRecibo>{'0'}</numRecibo>
            {
                if ($payloadRequest/ns1:numIdentificacionPredio)
                then <numeroMatricula>{fn:substring(fn:data($payloadRequest/ns1:numIdentificacionPredio),4)}</numeroMatricula>
                else ()
            }
            <pin>{'-1'}</pin>
            <sincronizar>{'true'}</sincronizar>
            <sistemaUsuario>{fn:string(dvm:lookup('ExpuestosExternamente/LoginNOC/DVM/Login_NOC', 'Llave', 'User', 'Valor', ''))}
</sistemaUsuario>
            <solicitante>{'Bachue'}</solicitante>
            <tarifa>{'E'}</tarifa>
            <tipoPago>{'0'}</tipoPago>
            <usaCanalesRecaudo></usaCanalesRecaudo>
            <uso>{'PRUEBA'}</uso>
        </entrada>
    </ns2:obtenerPDF>
};

local:func($payloadRequest)