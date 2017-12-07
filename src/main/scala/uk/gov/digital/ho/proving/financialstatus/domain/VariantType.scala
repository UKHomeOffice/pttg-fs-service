package uk.gov.digital.ho.proving.financialstatus.domain

import java.util.Optional

import org.springframework.beans.factory.annotation.{Autowired, Value}
import org.springframework.stereotype.Service
import uk.gov.digital.ho.proving.financialstatus.api.configuration.VariantTypeException

@Service
class VariantTypeChecker @Autowired() (@Value("${t5.youth.mobility.variant}") val t5YouthMobilityVariant: String,
                                       @Value("${t5.youth.temporary.variant}") val t5YouthTemporaryVariant: String) {

  private val T5_YOUTH_MOBILITY = t5YouthMobilityVariant
  private val T5_YOUTH_TEMPORARY = t5YouthTemporaryVariant

  val values = Vector(T5_YOUTH_MOBILITY, T5_YOUTH_TEMPORARY)

  def getVariantType(javaRawVariantTypeOptional: Optional[String], applicantType: ApplicantType): Option[VariantType] = {

    val rawVariantTypeOptional: Option[String] = if (javaRawVariantTypeOptional.isPresent) Some(javaRawVariantTypeOptional.get) else None

    rawVariantTypeOptional match {
      case Some(rawVariantType) => Some(determineVariantType(rawVariantType, applicantType))
      case None => None
    }
  }

  def determineVariantType(rawVariantType: String, applicantType: ApplicantType): VariantType = {
    rawVariantType.toLowerCase() match {
      case T5_YOUTH_MOBILITY => {
        if (applicantType != MainApplicant) {
          throw VariantTypeException("T5 youth mobility variant is only valid for the Main Applicant route" + rawVariantType)
        }
        T5YouthMobilityVariant
      }
      case T5_YOUTH_TEMPORARY => {
        T5YouthTemporaryVariant
      }
      case _ => throw VariantTypeException("Invalid variant type: " + rawVariantType)
    }
  }

  def getApplicantTypeName(variantType: VariantType): String = {
    variantType match {
      case T5YouthMobilityVariant => T5_YOUTH_MOBILITY
      case T5YouthTemporaryVariant => T5_YOUTH_TEMPORARY
    }
  }
}

sealed trait VariantType
case object T5YouthMobilityVariant extends VariantType
case object T5YouthTemporaryVariant extends VariantType
