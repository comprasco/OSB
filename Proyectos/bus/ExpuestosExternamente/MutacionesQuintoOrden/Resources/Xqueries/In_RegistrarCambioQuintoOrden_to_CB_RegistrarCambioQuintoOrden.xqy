xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/cb/mutacionesQuintoOrden/registrarCambioQuintoOrden/v1";
(:: import schema at "../Schemas/Legacy/CB_CC_RegistrarCambioQuintoOrden.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/ee/mutacionesQuintoOrden/registrarCambioQuintoOrden/v1";
(:: import schema at "../Schemas/EE_CC_RegistrarCambioQuintoOrden.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:entradaRegistrarCambioQuintoOrden) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:entradaRegistrarCambioQuintoOrden) ::)) as element() (:: schema-element(ns2:entradaRegistrarCambioQuintoOrden) ::) {
    <ns2:entradaRegistrarCambioQuintoOrden>
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
            if ($payloadRequest/ns1:codDepartamento)
            then <ns2:codDepartamento>{fn:data($payloadRequest/ns1:codDepartamento)}</ns2:codDepartamento>
            else ()
        }
        {
            if ($payloadRequest/ns1:codMunicipio)
            then <ns2:codMunicipio>{fn:data($payloadRequest/ns1:codMunicipio)}</ns2:codMunicipio>
            else ()
        }
        {
            if ($payloadRequest/ns1:predio)
            then 
                if ($payloadRequest/ns1:predio)
                then <ns2:predio>
                    {
                        if ($payloadRequest/ns1:predio/ns1:numPredial)
                        then <ns2:numPredial>{fn:data($payloadRequest/ns1:predio/ns1:numPredial)}</ns2:numPredial>
                        else ()
                    }</ns2:predio>
                else ()
            else ()
        }
    </ns2:entradaRegistrarCambioQuintoOrden>
};

local:func($payloadRequest)
