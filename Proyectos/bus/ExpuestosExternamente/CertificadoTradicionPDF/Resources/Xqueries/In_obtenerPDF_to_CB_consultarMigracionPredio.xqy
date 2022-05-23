xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/services/bachue/ee/cb/certificadotradicionpdf/obtenerPDF/v1";
(:: import schema at "../Schemas/EE_CTP_obtenerPDF.xsd" ::)
declare namespace ns2="https://www.supernotariado.gov.co/services/bachue/cb/consultamigracion/consultarMigracionPredio/v1";
(:: import schema at "../../../ConsultaMigracion/Resources/Schemas/Legacy/CB_CM_consultarMigracionPredio.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:entradaCertificadoTradicionPDF) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:entradaCertificadoTradicionPDF) ::)) as element() (:: schema-element(ns2:entradaConsultaMigracionPredio) ::) {
    <ns2:entradaConsultaMigracionPredio>
        {
            if ($payloadRequest/ns1:tipoIdentificacionPredio)
            then <ns2:tipoIdentificacionPredio>{fn:data($payloadRequest/ns1:tipoIdentificacionPredio)}</ns2:tipoIdentificacionPredio>
            else ()
        }
        {
            if ($payloadRequest/ns1:numIdentificacionPredio)
            then <ns2:numIdentificacionPredio>{fn:data($payloadRequest/ns1:numIdentificacionPredio)}</ns2:numIdentificacionPredio>
            else ()
        }
    </ns2:entradaConsultaMigracionPredio>
};

local:func($payloadRequest)