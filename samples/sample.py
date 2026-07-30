"""Calm Night — Python sample."""
import time
from dataclasses import dataclass
from enum import Enum

MAX_RETRIES = 3
CARD_RE = r"^\d{13,19}$"


class ChargeStatus(Enum):
    PENDING = "pending"
    APPROVED = "approved"
    DECLINED = "declined"


@dataclass
class Charge:
    id: str
    amount_cents: int  # money is integer cents, never floats
    currency: str = "USD"
    status: ChargeStatus = ChargeStatus.PENDING


def format_usd(cents: int) -> str:
    return f"${cents / 100:.2f}"


def charge(customer_id: str, amount: int) -> Charge:
    if amount <= 0:
        raise ValueError(f"invalid amount: {amount}")

    for attempt in range(1, MAX_RETRIES + 1):
        try:
            return gateway.submit(customer_id, amount)
        except GatewayError:
            time.sleep(2 ** attempt * 0.1)

    raise RuntimeError("gateway unavailable after retries")
