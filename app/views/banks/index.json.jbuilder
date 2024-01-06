# frozen_string_literal: true

json.array! @banks, partial: 'banks/bank', as: :bank
