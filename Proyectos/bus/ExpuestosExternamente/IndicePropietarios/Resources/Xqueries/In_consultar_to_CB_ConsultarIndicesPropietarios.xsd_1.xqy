xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="https://www.supernotariado.gov.co/services/bachue/cb/indicepropietarios/consultar/v1";
(:: import schema at "../Schemas/Legacy/CB_IP_consultar.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/services/bachue/ee/indicepropietarios/consultar/v1";
(:: import schema at "../Schemas/EE_IP_consultar.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:entradaIndicePropietarios) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:entradaIndicePropietarios) ::)) as element() (:: schema-element(ns2:entradaIndicePropietarios) ::) {
    <ns2:entradaIndicePropietarios>
        {
            if ($payloadRequest/ns1:tipoDocumentoPersona)
            then <ns2:tipoDocumentoPersona>{fn:data($payloadRequest/ns1:tipoDocumentoPersona)}</ns2:tipoDocumentoPersona>
            else ()
        }
        {
            if ($payloadRequest/ns1:numDocumentoPersona)
            then <ns2:numDocumentoPersona>{fn:data($payloadRequest/ns1:numDocumentoPersona)}</ns2:numDocumentoPersona>
            else ()
        }
        {
            if ($payloadRequest/ns1:numNIT)
            then <ns2:numNIT>{fn:data($payloadRequest/ns1:numNIT)}</ns2:numNIT>
            else ()
        }
        {
            if ($payloadRequest/ns1:primerNombre)
            then <ns2:primerNombre>{fn:data($payloadRequest/ns1:primerNombre)}</ns2:primerNombre>
            else ()
        }
        {
            if ($payloadRequest/ns1:segundoNombre)
            then <ns2:segundoNombre>{fn:data($payloadRequest/ns1:segundoNombre)}</ns2:segundoNombre>
            else ()
        }
        {
            if ($payloadRequest/ns1:primerApellido)
            then <ns2:primerApellido>{fn:data($payloadRequest/ns1:primerApellido)}</ns2:primerApellido>
            else ()
        }
        {
            if ($payloadRequest/ns1:segundoApellido)
            then <ns2:segundoApellido>{fn:data($payloadRequest/ns1:segundoApellido)}</ns2:segundoApellido>
            else ()
        }
        {
            if ($payloadRequest/ns1:razonSocial)
            then <ns2:razonSocial>{fn:data($payloadRequest/ns1:razonSocial)}</ns2:razonSocial>
            else ()
        }
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
        {
            if ($payloadRequest/ns1:convenio)
            then <ns2:convenio>{fn:data($payloadRequest/ns1:convenio)}</ns2:convenio>
            else ()
        }
        {
            if ($payloadRequest/ns1:codDepartamento)
            then <ns2:codDepartamento>{fn:data($payloadRequest/ns1:codDepartamento)}</ns2:codDepartamento>
            else ()
        }
        {
            if ($payloadRequest/ns1:codMunicipio)
            then <ns2:codMunicipio>{fn:data($payloadRequest/ns1:codMunicipio)}</ns2:codMunicipio>
            else ()
        }
        
     </ns2:entradaIndicePropietarios>
};

local:func($payloadRequest)
