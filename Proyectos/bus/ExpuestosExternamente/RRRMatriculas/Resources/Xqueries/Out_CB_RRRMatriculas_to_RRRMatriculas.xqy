xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/ee/RRRMatriculas/consultarRRRMatriculas/v1";
(:: import schema at "../Schemas/Legacy/EE_CC_ConsultarRRRMatriculas.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:salidaConsultarRRRMatriculas) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:salidaConsultarRRRMatriculas) ::)) as element() (:: schema-element(ns1:salidaConsultarRRRMatriculas) ::) {
<ns1:salidaConsultarRRRMatriculas>
        {
            if ($payloadResponse/ns1:codDepartamento)
            then <ns1:codDepartamento>{fn:data($payloadResponse/ns1:codDepartamento)}</ns1:codDepartamento>
            else ()
        }
        {
            if ($payloadResponse/ns1:codMunicipio)
            then <ns1:codMunicipio>{fn:data($payloadResponse/ns1:codMunicipio)}</ns1:codMunicipio>
            else ()
        }
        {
            if ($payloadResponse/ns1:codCirculoRegistral)
            then <ns1:codCirculoRegistral>{fn:data($payloadResponse/ns1:codCirculoRegistral)}</ns1:codCirculoRegistral>
            else ()
        }
        {
            if ($payloadResponse/ns1:numMatriculaInmobiliaria)
            then <ns1:numMatriculaInmobiliaria>{fn:data($payloadResponse/ns1:numMatriculaInmobiliaria)}</ns1:numMatriculaInmobiliaria>
            else ()
        }
        {
            if ($payloadResponse/ns1:listaDerechos)
            then 
	<ns1:listaDerechos>
                    {
                        for $derecho in $payloadResponse/ns1:listaDerechos/ns1:derecho
                        return 
		<ns1:derecho>
                            {
                                if ($derecho/ns1:numAnotacion)
                                then <ns1:numAnotacion>{fn:data($derecho/ns1:numAnotacion)}</ns1:numAnotacion>
                                else ()
                            }
                            {
                                if ($derecho/ns1:comentario)
                                then <ns1:comentario>{fn:data($derecho/ns1:comentario)}</ns1:comentario>
                                else ()
                            }
                            {
                                if ($derecho/ns1:fechaAnotacion)
                                then <ns1:fechaAnotacion>{fn:data($derecho/ns1:fechaAnotacion)}</ns1:fechaAnotacion>
                                else ()
                            }
                            {
                                if ($derecho/ns1:codNaturalezaJuridicaFolio)
                                then <ns1:codNaturalezaJuridicaFolio>{fn:data($derecho/ns1:codNaturalezaJuridicaFolio)}</ns1:codNaturalezaJuridicaFolio>
                                else ()
                            }
                            {
                                if ($derecho/ns1:nomNaturalezaJuridicaFolio)
                                then <ns1:nomNaturalezaJuridicaFolio>{fn:data($derecho/ns1:nomNaturalezaJuridicaFolio)}</ns1:nomNaturalezaJuridicaFolio>
                                else ()
                            }
                            {
                                if ($derecho/ns1:dominioDRR)
                                then <ns1:dominioDRR>{fn:data($derecho/ns1:dominioDRR)}</ns1:dominioDRR>
                                else ()
                            }
                            {
                                if ($derecho/ns1:intervinientes)
                                then 
			<ns1:intervinientes>
                                        {
                                            for $interviniente in $derecho/ns1:intervinientes/ns1:interviniente
                                            return 
				<ns1:interviniente>
                                                {
                                                    if ($interviniente/ns1:tipoDocumentoPersona)
                                                    then <ns1:tipoDocumentoPersona>{fn:data($interviniente/ns1:tipoDocumentoPersona)}</ns1:tipoDocumentoPersona>
                                                    else ()
                                                }
                                                {
                                                    if ($interviniente/ns1:numDocumentoPersona)
                                                    then <ns1:numDocumentoPersona>{fn:data($interviniente/ns1:numDocumentoPersona)}</ns1:numDocumentoPersona>
                                                    else ()
                                                }
                                                {
                                                    if ($interviniente/ns1:primerNombre)
                                                    then <ns1:primerNombre>{fn:data($interviniente/ns1:primerNombre)}</ns1:primerNombre>
                                                    else ()
                                                }
                                                {
                                                    if ($interviniente/ns1:segundoNombre)
                                                    then <ns1:segundoNombre>{fn:data($interviniente/ns1:segundoNombre)}</ns1:segundoNombre>
                                                    else ()
                                                }
                                                {
                                                    if ($interviniente/ns1:primerApellido)
                                                    then <ns1:primerApellido>{fn:data($interviniente/ns1:primerApellido)}</ns1:primerApellido>
                                                    else ()
                                                }
                                                {
                                                    if ($interviniente/ns1:segundoApellido)
                                                    then <ns1:segundoApellido>{fn:data($interviniente/ns1:segundoApellido)}</ns1:segundoApellido>
                                                    else ()
                                                }
                                                {
                                                    if ($interviniente/ns1:razonSocial)
                                                    then <ns1:razonSocial>{fn:data($interviniente/ns1:razonSocial)}</ns1:razonSocial>
                                                    else ()
                                                }
                                                {
                                                    if ($interviniente/ns1:rolInterviniente)
                                                    then <ns1:rolInterviniente>{fn:data($interviniente/ns1:rolInterviniente)}</ns1:rolInterviniente>
                                                    else ()
                                                }
                                                {
                                                    if ($interviniente/ns1:tipoParteInteresada)
                                                    then <ns1:tipoParteInteresada>{fn:data($interviniente/ns1:tipoParteInteresada)}</ns1:tipoParteInteresada>
                                                    else ()
                                                }
				</ns1:interviniente>
                                        }
			</ns1:intervinientes>
                                else ()
                            }
		</ns1:derecho>
                    }
	</ns1:listaDerechos>
            else ()
        }
        {
            if ($payloadResponse/ns1:listaRestricciones)
            then 
	<ns1:listaRestricciones>
                    {
                        for $restriccion in $payloadResponse/ns1:listaRestricciones/ns1:restriccion
                        return 
		<ns1:restriccion>
                            {
                                if ($restriccion/ns1:numAnotacion)
                                then <ns1:numAnotacion>{fn:data($restriccion/ns1:numAnotacion)}</ns1:numAnotacion>
                                else ()
                            }
                            {
                                if ($restriccion/ns1:comentario)
                                then <ns1:comentario>{fn:data($restriccion/ns1:comentario)}</ns1:comentario>
                                else ()
                            }
                            {
                                if ($restriccion/ns1:fechaAnotacion)
                                then <ns1:fechaAnotacion>{fn:data($restriccion/ns1:fechaAnotacion)}</ns1:fechaAnotacion>
                                else ()
                            }
                            {
                                if ($restriccion/ns1:codNaturalezaJuridicaFolio)
                                then <ns1:codNaturalezaJuridicaFolio>{fn:data($restriccion/ns1:codNaturalezaJuridicaFolio)}</ns1:codNaturalezaJuridicaFolio>
                                else ()
                            }
                            {
                                if ($restriccion/ns1:nomNaturalezaJuridicaFolio)
                                then <ns1:nomNaturalezaJuridicaFolio>{fn:data($restriccion/ns1:nomNaturalezaJuridicaFolio)}</ns1:nomNaturalezaJuridicaFolio>
                                else ()
                            }
                            {
                                if ($restriccion/ns1:dominioDRR)
                                then <ns1:dominioDRR>{fn:data($restriccion/ns1:dominioDRR)}</ns1:dominioDRR>
                                else ()
                            }
                            {
                                if ($restriccion/ns1:intervinientes)
                                then 
			<ns1:intervinientes>
                                        {
                                            for $interviniente1 in $restriccion/ns1:intervinientes/ns1:interviniente
                                            return 
				<ns1:interviniente>
                                                {
                                                    if ($interviniente1/ns1:tipoDocumentoPersona)
                                                    then <ns1:tipoDocumentoPersona>{fn:data($interviniente1/ns1:tipoDocumentoPersona)}</ns1:tipoDocumentoPersona>
                                                    else ()
                                                }
                                                {
                                                    if ($interviniente1/ns1:numDocumentoPersona)
                                                    then <ns1:numDocumentoPersona>{fn:data($interviniente1/ns1:numDocumentoPersona)}</ns1:numDocumentoPersona>
                                                    else ()
                                                }
                                                {
                                                    if ($interviniente1/ns1:primerNombre)
                                                    then <ns1:primerNombre>{fn:data($interviniente1/ns1:primerNombre)}</ns1:primerNombre>
                                                    else ()
                                                }
                                                {
                                                    if ($interviniente1/ns1:segundoNombre)
                                                    then <ns1:segundoNombre>{fn:data($interviniente1/ns1:segundoNombre)}</ns1:segundoNombre>
                                                    else ()
                                                }
                                                {
                                                    if ($interviniente1/ns1:primerApellido)
                                                    then <ns1:primerApellido>{fn:data($interviniente1/ns1:primerApellido)}</ns1:primerApellido>
                                                    else ()
                                                }
                                                {
                                                    if ($interviniente1/ns1:segundoApellido)
                                                    then <ns1:segundoApellido>{fn:data($interviniente1/ns1:segundoApellido)}</ns1:segundoApellido>
                                                    else ()
                                                }
                                                {
                                                    if ($interviniente1/ns1:razonSocial)
                                                    then <ns1:razonSocial>{fn:data($interviniente1/ns1:razonSocial)}</ns1:razonSocial>
                                                    else ()
                                                }
                                                {
                                                    if ($interviniente1/ns1:rolInterviniente)
                                                    then <ns1:rolInterviniente>{fn:data($interviniente1/ns1:rolInterviniente)}</ns1:rolInterviniente>
                                                    else ()
                                                }
                                                {
                                                    if ($interviniente1/ns1:tipoParteInteresada)
                                                    then <ns1:tipoParteInteresada>{fn:data($interviniente1/ns1:tipoParteInteresada)}</ns1:tipoParteInteresada>
                                                    else ()
                                                }
				</ns1:interviniente>
                                        }
			</ns1:intervinientes>
                                else ()
                            }
		</ns1:restriccion>
                    }
	</ns1:listaRestricciones>
            else ()
        }
        {
            if ($payloadResponse/ns1:listaResponsabilidades)
            then 
	<ns1:listaResponsabilidades>
                    {
                        for $responsabilidad in $payloadResponse/ns1:listaResponsabilidades/ns1:responsabilidad
                        return 
		<ns1:responsabilidad>
                            {
                                if ($responsabilidad/ns1:numAnotacion)
                                then <ns1:numAnotacion>{fn:data($responsabilidad/ns1:numAnotacion)}</ns1:numAnotacion>
                                else ()
                            }
                            {
                                if ($responsabilidad/ns1:comentario)
                                then <ns1:comentario>{fn:data($responsabilidad/ns1:comentario)}</ns1:comentario>
                                else ()
                            }
                            {
                                if ($responsabilidad/ns1:fechaAnotacion)
                                then <ns1:fechaAnotacion>{fn:data($responsabilidad/ns1:fechaAnotacion)}</ns1:fechaAnotacion>
                                else ()
                            }
                            {
                                if ($responsabilidad/ns1:codNaturalezaJuridicaFolio)
                                then <ns1:codNaturalezaJuridicaFolio>{fn:data($responsabilidad/ns1:codNaturalezaJuridicaFolio)}</ns1:codNaturalezaJuridicaFolio>
                                else ()
                            }
                            {
                                if ($responsabilidad/ns1:nomNaturalezaJuridicaFolio)
                                then <ns1:nomNaturalezaJuridicaFolio>{fn:data($responsabilidad/ns1:nomNaturalezaJuridicaFolio)}</ns1:nomNaturalezaJuridicaFolio>
                                else ()
                            }
                            {
                                if ($responsabilidad/ns1:dominioDRR)
                                then <ns1:dominioDRR>{fn:data($responsabilidad/ns1:dominioDRR)}</ns1:dominioDRR>
                                else ()
                            }
                            {
                                if ($responsabilidad/ns1:intervinientes)
                                then 
			<ns1:intervinientes>
                                        {
                                            for $interviniente2 in $responsabilidad/ns1:intervinientes/ns1:interviniente
                                            return 
				<ns1:interviniente>
                                                {
                                                    if ($interviniente2/ns1:tipoDocumentoPersona)
                                                    then <ns1:tipoDocumentoPersona>{fn:data($interviniente2/ns1:tipoDocumentoPersona)}</ns1:tipoDocumentoPersona>
                                                    else ()
                                                }
                                                {
                                                    if ($interviniente2/ns1:numDocumentoPersona)
                                                    then <ns1:numDocumentoPersona>{fn:data($interviniente2/ns1:numDocumentoPersona)}</ns1:numDocumentoPersona>
                                                    else ()
                                                }
                                                {
                                                    if ($interviniente2/ns1:primerNombre)
                                                    then <ns1:primerNombre>{fn:data($interviniente2/ns1:primerNombre)}</ns1:primerNombre>
                                                    else ()
                                                }
                                                {
                                                    if ($interviniente2/ns1:segundoNombre)
                                                    then <ns1:segundoNombre>{fn:data($interviniente2/ns1:segundoNombre)}</ns1:segundoNombre>
                                                    else ()
                                                }
                                                {
                                                    if ($interviniente2/ns1:primerApellido)
                                                    then <ns1:primerApellido>{fn:data($interviniente2/ns1:primerApellido)}</ns1:primerApellido>
                                                    else ()
                                                }
                                                {
                                                    if ($interviniente2/ns1:segundoApellido)
                                                    then <ns1:segundoApellido>{fn:data($interviniente2/ns1:segundoApellido)}</ns1:segundoApellido>
                                                    else ()
                                                }
                                                {
                                                    if ($interviniente2/ns1:razonSocial)
                                                    then <ns1:razonSocial>{fn:data($interviniente2/ns1:razonSocial)}</ns1:razonSocial>
                                                    else ()
                                                }
                                                {
                                                    if ($interviniente2/ns1:rolInterviniente)
                                                    then <ns1:rolInterviniente>{fn:data($interviniente2/ns1:rolInterviniente)}</ns1:rolInterviniente>
                                                    else ()
                                                }
                                                {
                                                    if ($interviniente2/ns1:tipoParteInteresada)
                                                    then <ns1:tipoParteInteresada>{fn:data($interviniente2/ns1:tipoParteInteresada)}</ns1:tipoParteInteresada>
                                                    else ()
                                                }
				</ns1:interviniente>
                                        }
			</ns1:intervinientes>
                                else ()
                            }
		</ns1:responsabilidad>
                    }
	</ns1:listaResponsabilidades>
            else ()
        }
        {
            if ($payloadResponse/ns1:listaPublicidades)
            then 
	<ns1:listaPublicidades>
                    {
                        for $publicidad in $payloadResponse/ns1:listaPublicidades/ns1:publicidad
                        return 
		<ns1:publicidad>
                            {
                                if ($publicidad/ns1:numAnotacion)
                                then <ns1:numAnotacion>{fn:data($publicidad/ns1:numAnotacion)}</ns1:numAnotacion>
                                else ()
                            }
                            {
                                if ($publicidad/ns1:comentario)
                                then <ns1:comentario>{fn:data($publicidad/ns1:comentario)}</ns1:comentario>
                                else ()
                            }
                            {
                                if ($publicidad/ns1:fechaAnotacion)
                                then <ns1:fechaAnotacion>{fn:data($publicidad/ns1:fechaAnotacion)}</ns1:fechaAnotacion>
                                else ()
                            }
                            {
                                if ($publicidad/ns1:codNaturalezaJuridicaFolio)
                                then <ns1:codNaturalezaJuridicaFolio>{fn:data($publicidad/ns1:codNaturalezaJuridicaFolio)}</ns1:codNaturalezaJuridicaFolio>
                                else ()
                            }
                            {
                                if ($publicidad/ns1:nomNaturalezaJuridicaFolio)
                                then <ns1:nomNaturalezaJuridicaFolio>{fn:data($publicidad/ns1:nomNaturalezaJuridicaFolio)}</ns1:nomNaturalezaJuridicaFolio>
                                else ()
                            }
                            {
                                if ($publicidad/ns1:dominioDRR)
                                then <ns1:dominioDRR>{fn:data($publicidad/ns1:dominioDRR)}</ns1:dominioDRR>
                                else ()
                            }
                            {
                                if ($publicidad/ns1:intervinientes)
                                then 
			<ns1:intervinientes>
                                        {
                                            for $interviniente3 in $publicidad/ns1:intervinientes/ns1:interviniente
                                            return 
				<ns1:interviniente>
                                                {
                                                    if ($interviniente3/ns1:tipoDocumentoPersona)
                                                    then <ns1:tipoDocumentoPersona>{fn:data($interviniente3/ns1:tipoDocumentoPersona)}</ns1:tipoDocumentoPersona>
                                                    else ()
                                                }
                                                {
                                                    if ($interviniente3/ns1:numDocumentoPersona)
                                                    then <ns1:numDocumentoPersona>{fn:data($interviniente3/ns1:numDocumentoPersona)}</ns1:numDocumentoPersona>
                                                    else ()
                                                }
                                                {
                                                    if ($interviniente3/ns1:primerNombre)
                                                    then <ns1:primerNombre>{fn:data($interviniente3/ns1:primerNombre)}</ns1:primerNombre>
                                                    else ()
                                                }
                                                {
                                                    if ($interviniente3/ns1:segundoNombre)
                                                    then <ns1:segundoNombre>{fn:data($interviniente3/ns1:segundoNombre)}</ns1:segundoNombre>
                                                    else ()
                                                }
                                                {
                                                    if ($interviniente3/ns1:primerApellido)
                                                    then <ns1:primerApellido>{fn:data($interviniente3/ns1:primerApellido)}</ns1:primerApellido>
                                                    else ()
                                                }
                                                {
                                                    if ($interviniente3/ns1:segundoApellido)
                                                    then <ns1:segundoApellido>{fn:data($interviniente3/ns1:segundoApellido)}</ns1:segundoApellido>
                                                    else ()
                                                }
                                                {
                                                    if ($interviniente3/ns1:razonSocial)
                                                    then <ns1:razonSocial>{fn:data($interviniente3/ns1:razonSocial)}</ns1:razonSocial>
                                                    else ()
                                                }
                                                {
                                                    if ($interviniente3/ns1:rolInterviniente)
                                                    then <ns1:rolInterviniente>{fn:data($interviniente3/ns1:rolInterviniente)}</ns1:rolInterviniente>
                                                    else ()
                                                }
                                                {
                                                    if ($interviniente3/ns1:tipoParteInteresada)
                                                    then <ns1:tipoParteInteresada>{fn:data($interviniente3/ns1:tipoParteInteresada)}</ns1:tipoParteInteresada>
                                                    else ()
                                                }
				</ns1:interviniente>
                                        }
			</ns1:intervinientes>
                                else ()
                            }
		</ns1:publicidad>
                    }
	</ns1:listaPublicidades>
            else ()
        }
        {
            if ($payloadResponse/ns1:listaHipotecas)
            then 
	<ns1:listaHipotecas>
                    {
                        for $hipoteca in $payloadResponse/ns1:listaHipotecas/ns1:hipoteca
                        return 
		<ns1:hipoteca>
                            {
                                if ($hipoteca/ns1:numAnotacion)
                                then <ns1:numAnotacion>{fn:data($hipoteca/ns1:numAnotacion)}</ns1:numAnotacion>
                                else ()
                            }
                            {
                                if ($hipoteca/ns1:comentario)
                                then <ns1:comentario>{fn:data($hipoteca/ns1:comentario)}</ns1:comentario>
                                else ()
                            }
                            {
                                if ($hipoteca/ns1:fechaAnotacion)
                                then <ns1:fechaAnotacion>{fn:data($hipoteca/ns1:fechaAnotacion)}</ns1:fechaAnotacion>
                                else ()
                            }
                            {
                                if ($hipoteca/ns1:codNaturalezaJuridicaFolio)
                                then <ns1:codNaturalezaJuridicaFolio>{fn:data($hipoteca/ns1:codNaturalezaJuridicaFolio)}</ns1:codNaturalezaJuridicaFolio>
                                else ()
                            }
                            {
                                if ($hipoteca/ns1:nomNaturalezaJuridicaFolio)
                                then <ns1:nomNaturalezaJuridicaFolio>{fn:data($hipoteca/ns1:nomNaturalezaJuridicaFolio)}</ns1:nomNaturalezaJuridicaFolio>
                                else ()
                            }
                            {
                                if ($hipoteca/ns1:dominioDRR)
                                then <ns1:dominioDRR>{fn:data($hipoteca/ns1:dominioDRR)}</ns1:dominioDRR>
                                else ()
                            }
                            {
                                if ($hipoteca/ns1:intervinientes)
                                then 
			<ns1:intervinientes>
                                        {
                                            for $interviniente4 in $hipoteca/ns1:intervinientes/ns1:interviniente
                                            return 
				<ns1:interviniente>
                                                {
                                                    if ($interviniente4/ns1:tipoDocumentoPersona)
                                                    then <ns1:tipoDocumentoPersona>{fn:data($interviniente4/ns1:tipoDocumentoPersona)}</ns1:tipoDocumentoPersona>
                                                    else ()
                                                }
                                                {
                                                    if ($interviniente4/ns1:numDocumentoPersona)
                                                    then <ns1:numDocumentoPersona>{fn:data($interviniente4/ns1:numDocumentoPersona)}</ns1:numDocumentoPersona>
                                                    else ()
                                                }
                                                {
                                                    if ($interviniente4/ns1:primerNombre)
                                                    then <ns1:primerNombre>{fn:data($interviniente4/ns1:primerNombre)}</ns1:primerNombre>
                                                    else ()
                                                }
                                                {
                                                    if ($interviniente4/ns1:segundoNombre)
                                                    then <ns1:segundoNombre>{fn:data($interviniente4/ns1:segundoNombre)}</ns1:segundoNombre>
                                                    else ()
                                                }
                                                {
                                                    if ($interviniente4/ns1:primerApellido)
                                                    then <ns1:primerApellido>{fn:data($interviniente4/ns1:primerApellido)}</ns1:primerApellido>
                                                    else ()
                                                }
                                                {
                                                    if ($interviniente4/ns1:segundoApellido)
                                                    then <ns1:segundoApellido>{fn:data($interviniente4/ns1:segundoApellido)}</ns1:segundoApellido>
                                                    else ()
                                                }
                                                {
                                                    if ($interviniente4/ns1:razonSocial)
                                                    then <ns1:razonSocial>{fn:data($interviniente4/ns1:razonSocial)}</ns1:razonSocial>
                                                    else ()
                                                }
                                                {
                                                    if ($interviniente4/ns1:rolInterviniente)
                                                    then <ns1:rolInterviniente>{fn:data($interviniente4/ns1:rolInterviniente)}</ns1:rolInterviniente>
                                                    else ()
                                                }
                                                {
                                                    if ($interviniente4/ns1:tipoParteInteresada)
                                                    then <ns1:tipoParteInteresada>{fn:data($interviniente4/ns1:tipoParteInteresada)}</ns1:tipoParteInteresada>
                                                    else ()
                                                }
				</ns1:interviniente>
                                        }
			</ns1:intervinientes>
                                else ()
                            }
		</ns1:hipoteca>
                    }
	</ns1:listaHipotecas>
            else ()
        }
	<ns1:codMensaje>{fn:data($payloadResponse/ns1:codMensaje)}</ns1:codMensaje>

        {
            if ($payloadResponse/ns1:codMensaje=200)
            then <ns1:descripcionMensaje>{'OK'}</ns1:descripcionMensaje>
            else (

					if ($payloadResponse/ns1:codMensaje=427)
					then <ns1:descripcionMensaje>{'El número de identificación catastral no existe en Bachué.'}</ns1:descripcionMensaje>
					else (
							if ($payloadResponse/ns1:codMensaje=427)
							then <ns1:descripcionMensaje>{'El número de identificación catastral no existe en Bachué.'}</ns1:descripcionMensaje>
							else (
									if ($payloadResponse/ns1:codMensaje=428)
									then <ns1:descripcionMensaje>{'Debe ingresar un número de identificación catastral.'}</ns1:descripcionMensaje>
									else (
											if ($payloadResponse/ns1:codMensaje=429)
											then <ns1:descripcionMensaje>{'Debe ingresar un tipo de identificación catastral válido.'}</ns1:descripcionMensaje>
											else (
													if ($payloadResponse/ns1:descripcionMensaje)
													then <ns1:descripcionMensaje>{fn:data($payloadResponse/ns1:descripcionMensaje)}</ns1:descripcionMensaje>
													else ()
												)
										)
								)
						)
				)
        }   
</ns1:salidaConsultarRRRMatriculas>
};

local:func($payloadResponse)
