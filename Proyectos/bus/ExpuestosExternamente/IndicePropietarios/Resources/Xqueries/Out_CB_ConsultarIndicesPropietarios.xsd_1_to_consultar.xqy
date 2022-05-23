xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/services/bachue/cb/indicepropietarios/consultar/v1";
(:: import schema at "../Schemas/Legacy/CB_IP_consultar.xsd" ::)
declare namespace ns2="https://www.supernotariado.gov.co/services/bachue/ee/indicepropietarios/consultar/v1";
(:: import schema at "../Schemas/EE_IP_consultar.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:salidaIndicePropietarios) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:salidaIndicePropietarios) ::)) as element() (:: schema-element(ns2:salidaIndicePropietarios) ::) {
    <ns2:salidaIndicePropietarios>
        {
            if ($payloadResponse/ns1:cantidadResultados)
            then <ns2:cantidadResultados>{fn:data($payloadResponse/ns1:cantidadResultados)}</ns2:cantidadResultados>
            else ()
        }
        {
        for $datosInmueble in $payloadResponse/ns1:datosInmueble
return
        <ns2:datosInmueble>
         {
                if ($datosInmueble/ns1:codCirculoRegistral)
                   then <ns2:codCirculoRegistral>{fn:data($datosInmueble/ns1:codCirculoRegistral)}</ns2:codCirculoRegistral>
                else ()
            }
            {
                if ($datosInmueble/ns1:codDepartamento)
                then <ns2:codDepartamento>{fn:data($datosInmueble/ns1:codDepartamento)}</ns2:codDepartamento>
                else ()
            }
            {
                if ($datosInmueble/ns1:codMunicipio)
                then <ns2:codMunicipio>{fn:data($datosInmueble/ns1:codMunicipio)}</ns2:codMunicipio>
                else ()
            }
            {
                if ($datosInmueble/ns1:direccionPredio)
                then <ns2:direccionPredio>{fn:data($datosInmueble/ns1:direccionPredio)}</ns2:direccionPredio>
                else ()
            }
            {
                if ($datosInmueble/ns1:numMatriculaInmobiliaria)
                then <ns2:numMatriculaInmobiliaria>{fn:data($datosInmueble/ns1:numMatriculaInmobiliaria)}</ns2:numMatriculaInmobiliaria>
                else ()
            }
            {
                if ($datosInmueble/ns1:numPredial)
                then <ns2:numPredial>{fn:data($datosInmueble/ns1:numPredial)}</ns2:numPredial>
                else ()
            }
            {
                if ($datosInmueble/ns1:NUPRE)
                then <ns2:NUPRE>{fn:data($datosInmueble/ns1:NUPRE)}</ns2:NUPRE>
                else ()
            }
            {
                if ($datosInmueble/ns1:nomCirculoRegistral)
                then <ns2:nomCirculoRegistral>{fn:data($datosInmueble/ns1:nomCirculoRegistral)}</ns2:nomCirculoRegistral>
                else ()
            }
            {
                if ($datosInmueble/ns1:nomDepartamento)
                then <ns2:nomDepartamento>{fn:data($datosInmueble/ns1:nomDepartamento)}</ns2:nomDepartamento>
                else ()
            }
            {
                if ($datosInmueble/ns1:nomMunicipio)
                then <ns2:nomMunicipio>{fn:data($datosInmueble/ns1:nomMunicipio)}</ns2:nomMunicipio>
                else ()
            }
            {
                for $propietarios in $datosInmueble/ns1:propietarios
                return 
                <ns2:propietarios>
                    {
                        if ($propietarios/ns1:numNIT)
                        then <ns2:numNIT>{fn:data($propietarios/ns1:numNIT)}</ns2:numNIT>
                        else ()
                    }
                    {
                        if ($propietarios/ns1:numDocumentoPersona)
                        then <ns2:numDocumentoPersona>{fn:data($propietarios/ns1:numDocumentoPersona)}</ns2:numDocumentoPersona>
                        else ()
                    }
                    {
                        if ($propietarios/ns1:nomTipoDocumento)
                        then <ns2:nomTipoDocumento>{fn:data($propietarios/ns1:nomTipoDocumento)}</ns2:nomTipoDocumento>
                        else ()
                    }
                    {
                        if ($propietarios/ns1:nomPropietario)
                        then <ns2:nomPropietario>{fn:data($propietarios/ns1:nomPropietario)}</ns2:nomPropietario>
                        else ()
                    }</ns2:propietarios>
            }
            
           
        </ns2:datosInmueble>
        }
        {
            if ($payloadResponse/ns1:codMensaje)
            then <ns2:codMensaje>{fn:data($payloadResponse/ns1:codMensaje)}</ns2:codMensaje>
            else ()
        }
        {
            if ($payloadResponse/ns1:descripcionMensaje)
            then <ns2:descripcionMensaje>{fn:data($payloadResponse/ns1:descripcionMensaje)}</ns2:descripcionMensaje>
            else ()
        }
    </ns2:salidaIndicePropietarios>
};

local:func($payloadResponse)
