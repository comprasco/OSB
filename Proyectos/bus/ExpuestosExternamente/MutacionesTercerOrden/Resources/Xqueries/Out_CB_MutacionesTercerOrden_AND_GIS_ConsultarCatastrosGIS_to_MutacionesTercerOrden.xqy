xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/cb/mutacionesTercerOrden/consultaCambioTercerOrden/v1";
(:: import schema at "../Schemas/Legacy/CB_CC_ConsultaCambioTercerOrden.xsd" ::)
declare namespace ns3="https://www.supernotariado.gov.co/schemas/bachue/ee/mutacionesTercerOrden/consultaCambioTercerOrden/v1";
(:: import schema at "../Schemas/EE_CC_ConsultaCambioTercerOrden.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/gis/mutacionesTercerOrden/consultaCambioTercerOrden/v1";
(:: import schema at "../Schemas/Legacy/GIS_CC_ConsultarCatastrosGIS.xsd" ::)

declare variable $payloadResponseGIS as element() (:: schema-element(ns1:root) ::) external;
declare variable $payloadResponseCB as element() (:: schema-element(ns2:salidaConsultaCambioTercerOrden) ::) external;

declare function local:func($payloadResponseGIS as element() (:: schema-element(ns1:root) ::), 
                            $payloadResponseCB as element() (:: schema-element(ns2:salidaConsultaCambioTercerOrden) ::)) 
                            as element() (:: schema-element(ns3:salidaConsultaCambioTercerOrden) ::) {
    <ns3:salidaConsultaCambioTercerOrden>
        {
            if ($payloadResponseCB/ns2:codDepartamento)
            then <ns3:codDepartamento>{fn:data($payloadResponseCB/ns2:codDepartamento)}</ns3:codDepartamento>
            else ()
        }
        {
            if ($payloadResponseCB/ns2:codMunicipio)
            then <ns3:codMunicipio>{fn:data($payloadResponseCB/ns2:codMunicipio)}</ns3:codMunicipio>
            else ()
        }
        {
            if ($payloadResponseCB/ns2:codCirculoRegistral)
            then <ns3:codCirculoRegistral>{fn:data($payloadResponseCB/ns2:codCirculoRegistral)}</ns3:codCirculoRegistral>
            else ()
        }
        {
            if ($payloadResponseCB/ns2:numIdentificacionPredio)
            then <ns3:numIdentificacionPredio>{fn:data($payloadResponseCB/ns2:numIdentificacionPredio)}</ns3:numIdentificacionPredio>
            else ()
        }
        {
            if ($payloadResponseCB/ns2:tipoPredio)
            then <ns3:tipoPredio>{fn:data($payloadResponseCB/ns2:tipoPredio)}</ns3:tipoPredio>
            else ()
        }
        <ns3:anotacionesPredio>
            <ns3:anotacionPredio>
                {
                    if ($payloadResponseCB/ns2:anotacionesPredio/ns2:anotacionPredio/ns2:comentario)
                    then <ns3:comentario>{fn:data($payloadResponseCB/ns2:anotacionesPredio/ns2:anotacionPredio/ns2:comentario)}</ns3:comentario>
                    else ()
                }
                {
                    if ($payloadResponseCB/ns2:anotacionesPredio/ns2:anotacionPredio/ns2:fechaAnotacion)
                    then <ns3:fechaAnotacion>{fn:data($payloadResponseCB/ns2:anotacionesPredio/ns2:anotacionPredio/ns2:fechaAnotacion)}</ns3:fechaAnotacion>
                    else ()
                }
                {
                    if ($payloadResponseCB/ns2:anotacionesPredio/ns2:anotacionPredio/ns2:codNaturalezaJuridicaFolio)
                    then <ns3:codNaturalezaJuridicaFolio>{fn:data($payloadResponseCB/ns2:anotacionesPredio/ns2:anotacionPredio/ns2:codNaturalezaJuridicaFolio)}</ns3:codNaturalezaJuridicaFolio>
                    else ()
                }
                <ns3:tipoConstruccion>{fn:data($payloadResponseGIS/ns1:results[ns1:paramName='TIPO_CONSTRUCCION']/ns1:value)}</ns3:tipoConstruccion>
            </ns3:anotacionPredio>
        </ns3:anotacionesPredio>
        <ns3:codMensaje>{fn:data($payloadResponseGIS/ns1:results[ns1:paramName='ERROR']/ns1:value)}</ns3:codMensaje>
        <ns3:descripcionMensaje>{fn:data($payloadResponseGIS/ns1:results[ns1:paramName='MENSAJE']/ns1:value)}</ns3:descripcionMensaje>
        
    </ns3:salidaConsultaCambioTercerOrden>
};

local:func($payloadResponseGIS, $payloadResponseCB)