xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://consultaindicespropietarios.snr.gov.co/";
(:: import schema at "../Schemas/Legacy/ConsultaIndicesPropietarios.xsd_1.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/services/bachue/cb/indicepropietarios/consultar/v1";
(:: import schema at "../Schemas/Legacy/CB_IP_consultar.xsd" ::)
declare namespace ns3="https://www.supernotariado.gov.co/services/bachue/ee/indicepropietarios/consultar/v1";
(:: import schema at "../Schemas/EE_IP_consultar.xsd" ::)

declare variable $payloadCBResponse as element() (:: schema-element(ns1:salidaIndicePropietarios) ::) external;
declare variable $payloadNOCResponse as element() (:: schema-element(ns2:consultarResponse) ::) external;

declare function local:func($payloadCBResponse as element() (:: schema-element(ns1:salidaIndicePropietarios) ::), 
                            $payloadNOCResponse as element() (:: schema-element(ns2:consultarResponse) ::)) 
                            as element() (:: schema-element(ns3:salidaIndicePropietarios) ::) {
    <ns3:salidaIndicePropietarios>
        <ns3:cantidadResultados></ns3:cantidadResultados>
         {
        for $datosInmueble in $payloadCBResponse/ns1:datosInmueble
return
        <ns3:datosInmueble>
         {
                if ($datosInmueble/ns1:codCirculoRegistral)
                   then <ns3:codCirculoRegistral>{fn:data($datosInmueble/ns1:codCirculoRegistral)}</ns3:codCirculoRegistral>
                else ()
            }
            {
                if ($datosInmueble/ns1:codDepartamento)
                then <ns3:codDepartamento>{fn:data($datosInmueble/ns1:codDepartamento)}</ns3:codDepartamento>
                else ()
            }
            {
                if ($datosInmueble/ns1:codMunicipio)
                then <ns3:codMunicipio>{fn:data($datosInmueble/ns1:codMunicipio)}</ns3:codMunicipio>
                else ()
            }
            {
                if ($datosInmueble/ns1:direccionPredio)
                then <ns3:direccionPredio>{fn:data($datosInmueble/ns1:direccionPredio)}</ns3:direccionPredio>
                else ()
            }
            {
                if ($datosInmueble/ns1:numMatriculaInmobiliaria)
                then <ns3:numMatriculaInmobiliaria>{fn:data($datosInmueble/ns1:numMatriculaInmobiliaria)}</ns3:numMatriculaInmobiliaria>
                else ()
            }
            {
                if ($datosInmueble/ns1:numPredial)
                then <ns3:numPredial>{fn:data($datosInmueble/ns1:numPredial)}</ns3:numPredial>
                else ()
            }
            {
                if ($datosInmueble/ns1:NUPRE)
                then <ns3:NUPRE>{fn:data($datosInmueble/ns1:NUPRE)}</ns3:NUPRE>
                else ()
            }
            {
                if ($datosInmueble/ns1:nomCirculoRegistral)
                then <ns3:nomCirculoRegistral>{fn:data($datosInmueble/ns1:nomCirculoRegistral)}</ns3:nomCirculoRegistral>
                else ()
            }
            {
                if ($datosInmueble/ns1:nomDepartamento)
                then <ns3:nomDepartamento>{fn:data($datosInmueble/ns1:nomDepartamento)}</ns3:nomDepartamento>
                else ()
            }
            {
                if ($datosInmueble/ns1:nomMunicipio)
                then <ns3:nomMunicipio>{fn:data($datosInmueble/ns1:nomMunicipio)}</ns3:nomMunicipio>
                else ()
            }
            {
                for $propietarios in $datosInmueble/ns1:propietarios
                return 
                <ns3:propietarios>
                    {
                        if ($propietarios/ns1:numNIT)
                        then <ns3:numNIT>{fn:data($propietarios/ns1:numNIT)}</ns3:numNIT>
                        else ()
                    }
                    {
                        if ($propietarios/ns1:numDocumentoPersona)
                        then <ns3:numDocumentoPersona>{fn:data($propietarios/ns1:numDocumentoPersona)}</ns3:numDocumentoPersona>
                        else ()
                    }
                    {
                        if ($propietarios/ns1:nomTipoDocumento)
                        then <ns3:nomTipoDocumento>{fn:data($propietarios/ns1:nomTipoDocumento)}</ns3:nomTipoDocumento>
                        else ()
                    }
                    {
                        if ($propietarios/ns1:nomPropietario)
                        then <ns3:nomPropietario>{fn:data($propietarios/ns1:nomPropietario)}</ns3:nomPropietario>
                        else ()
                    }</ns3:propietarios>
            }
            
           
        </ns3:datosInmueble>
        }
        {
            for $datosInmueble in $payloadNOCResponse/return/datosInmueble
            return 
            <ns3:datosInmueble>
                {
                    if ($datosInmueble/circulo)
                    then <ns3:codCirculoRegistral>{fn:data($datosInmueble/circulo)}</ns3:codCirculoRegistral>
                    else ()
                }
                {
                    if ($datosInmueble/codigoDepartamento)
                    then <ns3:codDepartamento>{fn:data($datosInmueble/codigoDepartamento)}</ns3:codDepartamento>
                    else ()
                }
                {
                    if ($datosInmueble/codigoMunicipio)
                    then <ns3:codMunicipio>{fn:data($datosInmueble/codigoMunicipio)}</ns3:codMunicipio>
                    else ()
                }
                {
                    if ($datosInmueble/direccion)
                    then <ns3:direccionPredio>{fn:data($datosInmueble/direccion)}</ns3:direccionPredio>
                    else ()
                }
                {
                    if ($datosInmueble/matricula)
                    then <ns3:numMatriculaInmobiliaria>{fn:data($datosInmueble/matricula)}</ns3:numMatriculaInmobiliaria>
                    else ()
                }
                
            <ns3:NUPRE></ns3:NUPRE>
                {
                    if ($datosInmueble/nombreCirculo)
                    then <ns3:nomCirculoRegistral>{fn:data($datosInmueble/nombreCirculo)}</ns3:nomCirculoRegistral>
                    else ()
                }
                {
                    if ($datosInmueble/nombreDepartamento)
                    then <ns3:nomDepartamento>{fn:data($datosInmueble/nombreDepartamento)}</ns3:nomDepartamento>
                    else ()
                }
                {
                    if ($datosInmueble/nombreMunicipio)
                    then <ns3:nomMunicipio>{fn:data($datosInmueble/nombreMunicipio)}</ns3:nomMunicipio>
                    else ()
                }
                {
                    for $propietarios in $datosInmueble/propietarios
                    return 
                    <ns3:propietarios>
                        {
                            if ($propietarios/numeroDocumento)
                            then <ns3:numDocumentoPersona>{fn:data($propietarios/numeroDocumento)}</ns3:numDocumentoPersona>
                            else ()
                        }
                        {
                            if ($propietarios/tipoDocumento)
                            then <ns3:nomTipoDocumento>{fn:data($propietarios/tipoDocumento)}</ns3:nomTipoDocumento>
                            else ()
                        }
                        {
                            if ($propietarios/nombre)
                            then <ns3:nomPropietario>{fn:data($propietarios/nombre)}</ns3:nomPropietario>
                            else ()
                        }</ns3:propietarios>
                }
            <ns3:numPredial></ns3:numPredial>
            </ns3:datosInmueble>
        }
       
        <ns3:fechaHoraConsulta></ns3:fechaHoraConsulta>
        <ns3:codMensaje></ns3:codMensaje>
        <ns3:descripcionMensaje></ns3:descripcionMensaje>
        <ns3:numeroConsulta></ns3:numeroConsulta>
    </ns3:salidaIndicePropietarios>
};

local:func($payloadCBResponse, $payloadNOCResponse)
