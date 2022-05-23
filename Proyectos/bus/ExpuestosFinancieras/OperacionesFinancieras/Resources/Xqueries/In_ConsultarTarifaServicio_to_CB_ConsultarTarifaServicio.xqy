xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/cb/operacionesfinancieras/consultartarifaservicio/v2";
(:: import schema at "../Schemas/Legacy/CB_OF_ConsultarTarifaServicio.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/ef/operacionesfinancieras/consultartarifaservicio/v2";
(:: import schema at "../Schemas/EF_OF_ConsultarTarifaServicio.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:entradaConsultarTarifaServicio) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:entradaConsultarTarifaServicio) ::)) as element() (:: schema-element(ns2:entradaConsultarTarifaServicio) ::) {
    <ns2:entradaConsultarTarifaServicio>
        <ns2:tipoDocSolicitante>{fn:data($payloadRequest/ns1:tipoDocSolicitante)}</ns2:tipoDocSolicitante>
        <ns2:numeroDocSolicitante>{fn:data($payloadRequest/ns1:numeroDocSolicitante)}</ns2:numeroDocSolicitante>
        {
            if ($payloadRequest/ns1:codigoConvenio)
            then <ns2:codigoConvenio>{fn:data($payloadRequest/ns1:codigoConvenio)}</ns2:codigoConvenio>
            else ()
        }
        <ns2:canalOrigen>{fn:data($payloadRequest/ns1:canalOrigen)}</ns2:canalOrigen>
        <ns2:servicios>
            {
                for $servicio in $payloadRequest/ns1:servicios/ns1:servicio
                return 
                <ns2:servicio>
                    <ns2:tipoServicio>{fn:data($servicio/ns1:tipoServicio)}</ns2:tipoServicio>
                    <ns2:subtipoServicio>{fn:data($servicio/ns1:subtipoServicio)}</ns2:subtipoServicio>
                    <ns2:criterios>
                        {
                            for $criterio in $servicio/ns1:criterios/ns1:criterio
                            return 
                            <ns2:criterio>
                                <ns2:codigo>{fn:data($criterio/ns1:codigo)}</ns2:codigo>
                                <ns2:valor>{fn:data($criterio/ns1:valor)}</ns2:valor></ns2:criterio>
                        }
                    </ns2:criterios></ns2:servicio>
            }
        </ns2:servicios>
        
    </ns2:entradaConsultarTarifaServicio>
};

local:func($payloadRequest)