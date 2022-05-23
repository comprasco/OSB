xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://consultaindicespropietarios.snr.gov.co/";
(:: import schema at "../Schemas/Legacy/ConsultaIndicesPropietarios.xsd_1.xsd" ::)
declare namespace ns2="https://www.supernotariado.gov.co/services/bachue/ee/indicepropietarios/consultar/v1";
(:: import schema at "../Schemas/EE_IP_consultar.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:consultarResponse) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:consultarResponse) ::)) as element() (:: schema-element(ns2:salidaIndicePropietarios) ::) {
    <ns2:salidaIndicePropietarios>
        <ns2:cantidadResultados>{fn:data($payloadResponse/return/cantidadResultados)}</ns2:cantidadResultados>
        {
            for $datosInmueble in $payloadResponse/return/datosInmueble
            return 
            <ns2:datosInmueble>
                {
                    if ($datosInmueble/circulo)
                    then <ns2:codCirculoRegistral>{fn:data($datosInmueble/circulo)}</ns2:codCirculoRegistral>
                    else ()
                }
                {
                    if ($datosInmueble/codigoDepartamento)
                    then <ns2:codDepartamento>{fn:data($datosInmueble/codigoDepartamento)}</ns2:codDepartamento>
                    else ()
                }
                {
                    if ($datosInmueble/codigoMunicipio)
                    then <ns2:codMunicipio>{fn:data($datosInmueble/codigoMunicipio)}</ns2:codMunicipio>
                    else ()
                }
                {
                    if ($datosInmueble/direccion)
                    then <ns2:direccionPredio>{fn:data($datosInmueble/direccion)}</ns2:direccionPredio>
                    else ()
                }
                {
                    if ($datosInmueble/matricula)
                    then <ns2:numMatriculaInmobiliaria>{fn:data($datosInmueble/matricula)}</ns2:numMatriculaInmobiliaria>
                    else ()
                }
            <ns2:numPredial></ns2:numPredial>
            <ns2:NUPRE></ns2:NUPRE>
                {
                    if ($datosInmueble/nombreCirculo)
                    then <ns2:nomCirculoRegistral>{fn:data($datosInmueble/nombreCirculo)}</ns2:nomCirculoRegistral>
                    else ()
                }
                {
                    if ($datosInmueble/nombreDepartamento)
                    then <ns2:nomDepartamento>{fn:data($datosInmueble/nombreDepartamento)}</ns2:nomDepartamento>
                    else ()
                }
                {
                    if ($datosInmueble/nombreMunicipio)
                    then <ns2:nomMunicipio>{fn:data($datosInmueble/nombreMunicipio)}</ns2:nomMunicipio>
                    else ()
                }
                {
                    for $propietarios in $datosInmueble/propietarios
                    return 
                    <ns2:propietarios>
                        <ns2:numNIT></ns2:numNIT>
                        {
                            if ($propietarios/numeroDocumento)
                            then <ns2:numDocumentoPersona>{fn:data($propietarios/numeroDocumento)}</ns2:numDocumentoPersona>
                            else ()
                        }
                        {
                            if ($propietarios/tipoDocumento)
                            then <ns2:nomTipoDocumento>{fn:data($propietarios/tipoDocumento)}</ns2:nomTipoDocumento>
                            else ()
                        }
                        {
                            if ($propietarios/nombre)
                            then <ns2:nomPropietario>{fn:data($propietarios/nombre)}</ns2:nomPropietario>
                            else ()
                        }
                    </ns2:propietarios>
                }
            
            
            </ns2:datosInmueble>
        }
        <ns2:fechaHoraConsulta>{fn:data($payloadResponse/return/fechaConsulta)}</ns2:fechaHoraConsulta>
        
        {
            if ($payloadResponse/return/mensajeError)
            then <ns2:descripcionMensaje>{fn:data($payloadResponse/return/mensajeError)}</ns2:descripcionMensaje>
            else ()
        }
        <ns2:numeroConsulta>{fn:data($payloadResponse/return/numeroConsulta)}</ns2:numeroConsulta>
    </ns2:salidaIndicePropietarios>
};

local:func($payloadResponse)
