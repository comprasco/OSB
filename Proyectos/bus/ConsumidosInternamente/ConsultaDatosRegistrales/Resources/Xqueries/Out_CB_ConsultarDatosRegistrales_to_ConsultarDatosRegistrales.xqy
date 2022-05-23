xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/cb/consultadatosregistrales/consultardatosregistrales/v1";
(:: import schema at "../Schemas/Legacy/CB_CDR_ConsultarDatosRegistrales.xsd" ::)
declare namespace v1="https://www.supernotariado.gov.co/schemas/bachue/ci/consultadatosregistrales/consultardatosregistrales/v1";
(:: import schema at "../Schemas/CI_CDR_ConsultarDatosRegistrales.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:salidaConsultarDatosRegistrales) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:salidaConsultarDatosRegistrales) ::)) as element() (:: schema-element(v1:salidaConsultarDatosRegistrales) ::) {
    <v1:salidaConsultarDatosRegistrales>
        <v1:cantidadRegistros>{fn:data($payloadResponse/ns1:cantidadRegistros)}</v1:cantidadRegistros>
        <v1:matriculas>
            {
                for $matricula in $payloadResponse/ns1:matriculas/ns1:matricula
                return 
                <v1:matricula>
                    <v1:numero>{fn:data($matricula/ns1:numero)}</v1:numero>
                    <v1:matricula>{fn:data($matricula/ns1:matricula)}</v1:matricula>
                    <v1:codigoOrip>{fn:data($matricula/ns1:codigoOrip)}</v1:codigoOrip>
                    <v1:nombreOrip>{fn:data($matricula/ns1:nombreOrip)}</v1:nombreOrip>
                    {
                        if ($matricula/ns1:chip)
                        then <v1:chip>{fn:data($matricula/ns1:chip)}</v1:chip>
                        else ()
                    }
                    {
                        if ($matricula/ns1:estadoNupre)
                        then <v1:estadoNupre>{fn:data($matricula/ns1:estadoNupre)}</v1:estadoNupre>
                        else ()
                    }
                    {
                        if ($matricula/ns1:nupre)
                        then <v1:nupre>{fn:data($matricula/ns1:nupre)}</v1:nupre>
                        else ()
                    }
                    <v1:cedulaCatastral>{fn:data($matricula/ns1:cedulaCatastral)}</v1:cedulaCatastral>
                    <v1:direccionPredio>{fn:data($matricula/ns1:direccionPredio)}</v1:direccionPredio>
                    <v1:departamento>{fn:data($matricula/ns1:departamento)}</v1:departamento>
                    <v1:municipio>{fn:data($matricula/ns1:municipio)}</v1:municipio>
                    <v1:grupo>{fn:data($matricula/ns1:grupo)}</v1:grupo>
                    <v1:titulares>
                        {
                            for $titular in $matricula/ns1:titulares/ns1:titular
                            return 
                            <v1:titular>
                                <v1:tipoIdentificacionTitular>{fn:data($titular/ns1:tipoIdentificacionTitular)}</v1:tipoIdentificacionTitular>
                                <v1:identificacionTitular>{fn:data($titular/ns1:identificacionTitular)}</v1:identificacionTitular>
                                <v1:primerNombreTitular>{fn:data($titular/ns1:primerNombreTitular)}</v1:primerNombreTitular>
                                {
                                    if ($titular/ns1:segundoNombreTitular)
                                    then <v1:segundoNombreTitular>{fn:data($titular/ns1:segundoNombreTitular)}</v1:segundoNombreTitular>
                                    else ()
                                }
                                <v1:primerApellidoTitular>{fn:data($titular/ns1:primerApellidoTitular)}</v1:primerApellidoTitular>
                                {
                                    if ($titular/ns1:segundoApellidoTitular)
                                    then <v1:segundoApellidoTitular>{fn:data($titular/ns1:segundoApellidoTitular)}</v1:segundoApellidoTitular>
                                    else ()
                                }
                                <v1:porcentajeParticipacion>{fn:data($titular/ns1:porcentajeParticipacion)}</v1:porcentajeParticipacion></v1:titular>
                        }
                    </v1:titulares>
                    <v1:anotaciones>
                        {
                            for $anotacion in $matricula/ns1:anotaciones/ns1:anotacion
                            return 
                            <v1:anotacion>
                                <v1:consecutivoAnotacion>{fn:data($anotacion/ns1:consecutivoAnotacion)}</v1:consecutivoAnotacion>
                                <v1:tipoDocumentoAnotacion>{fn:data($anotacion/ns1:tipoDocumentoAnotacion)}</v1:tipoDocumentoAnotacion>
                                <v1:actoJuridico>{fn:data($anotacion/ns1:actoJuridico)}</v1:actoJuridico>
                                <v1:drr>{fn:data($anotacion/ns1:drr)}</v1:drr>
                                <v1:valorActo>{fn:data($anotacion/ns1:valorActo)}</v1:valorActo>
                                <v1:fechaAnotacion>{fn:data($anotacion/ns1:fechaAnotacion)}</v1:fechaAnotacion>
                                <v1:intervinientes>
                                    <v1:interviniente>
                                        <v1:tipoIdentificacionInterviniente>{fn:data($anotacion/ns1:intervinientes/ns1:interviniente/ns1:tipoIdentificacionInterviniente)}</v1:tipoIdentificacionInterviniente>
                                        <v1:identificacionInterviniente>{fn:data($anotacion/ns1:intervinientes/ns1:interviniente/ns1:identificacionInterviniente)}</v1:identificacionInterviniente>
                                        <v1:primerNombreInterviniente>{fn:data($anotacion/ns1:intervinientes/ns1:interviniente/ns1:primerNombreInterviniente)}</v1:primerNombreInterviniente>
                                        {
                                            if ($anotacion/ns1:intervinientes/ns1:interviniente/ns1:segundoNombreInterviniente)
                                            then <v1:segundoNombreInterviniente>{fn:data($anotacion/ns1:intervinientes/ns1:interviniente/ns1:segundoNombreInterviniente)}</v1:segundoNombreInterviniente>
                                            else ()
                                        }
                                        <v1:primerApellidoInterviniente>{fn:data($anotacion/ns1:intervinientes/ns1:interviniente/ns1:primerApellidoInterviniente)}</v1:primerApellidoInterviniente>
                                        {
                                            if ($anotacion/ns1:intervinientes/ns1:interviniente/ns1:segundoApellidoInterviniente)
                                            then <v1:segundoApellidoInterviniente>{fn:data($anotacion/ns1:intervinientes/ns1:interviniente/ns1:segundoApellidoInterviniente)}</v1:segundoApellidoInterviniente>
                                            else ()
                                        }
                                        <v1:rol>{fn:data($anotacion/ns1:intervinientes/ns1:interviniente/ns1:rol)}</v1:rol>
                                    </v1:interviniente>
                                </v1:intervinientes></v1:anotacion>
                        }
                    </v1:anotaciones></v1:matricula>
            }</v1:matriculas>
        <v1:codigoMensaje>{fn:data($payloadResponse/ns1:codigoMensaje)}</v1:codigoMensaje>
        {
            if ($payloadResponse/ns1:descripcionMensaje)
            then <v1:descripcionMensaje>{fn:data($payloadResponse/ns1:descripcionMensaje)}</v1:descripcionMensaje>
            else ()
        }
    </v1:salidaConsultarDatosRegistrales>
};

local:func($payloadResponse)
